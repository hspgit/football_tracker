import { ChangeDetectorRef, Component, Input, OnInit } from '@angular/core';
import {
  FormBuilder,
  FormGroup,
  FormsModule,
  ReactiveFormsModule,
  Validators,
} from '@angular/forms';
import { TeamService } from '../../services/team.service';
import { LeagueService } from '../../services/league.service';
import { GameService } from '../../services/game.service';
import { AsyncPipe, DatePipe } from '@angular/common';
import {
  MatAutocomplete,
  MatAutocompleteTrigger,
  MatOption,
} from '@angular/material/autocomplete';
import { MatButton } from '@angular/material/button';
import { MatFormField } from '@angular/material/form-field';
import { MatInputModule } from '@angular/material/input';
import { MatSelectModule } from '@angular/material/select';
import { MatStepperModule } from '@angular/material/stepper';
import { forkJoin, Observable } from 'rxjs';
import { map, startWith } from 'rxjs/operators';
import { Game, League, Player, PlayerStat, Team } from '../../app.models';
import { MatCardModule } from '@angular/material/card';
import { MatTableModule } from '@angular/material/table';
import { MatOptionModule } from '@angular/material/core';
import { MatCheckboxModule } from '@angular/material/checkbox';
import { PlayerStatService } from '../../services/player_stat.service';

@Component({
  selector: 'app-base-game-details',
  standalone: true,
  imports: [
    AsyncPipe,
    MatAutocomplete,
    MatAutocompleteTrigger,
    MatButton,
    MatFormField,
    MatInputModule,
    MatOptionModule,
    MatSelectModule,
    MatStepperModule,
    ReactiveFormsModule,
    MatCardModule,
    DatePipe,
    MatTableModule,
    FormsModule,
    MatCheckboxModule,
  ],
  templateUrl: './view-game.component.html',
  styleUrl: './view-game.component.css',
})
export class ViewGameComponent implements OnInit {
  teamsFormGroup: FormGroup;
  leagueAndSeasonFormGroup: FormGroup;
  leagues: string[] = [];
  seasons: number[] = [2022, 2023, 2024];
  team1FilteredOptions: Observable<string[]> | undefined;
  team2FilteredOptions: Observable<string[]> | undefined;
  team1Options: string[] = [];
  team2Options: string[] = [];
  availableGames: Game[] = [];
  selectedGame: Game | undefined;
  team1PlayerStats: PlayerStat[] = [];
  team2PlayerStats: PlayerStat[] = [];
  team1Players: Player[] = [];
  team2Players: Player[] = [];
  selectedGamePlayerStats: PlayerStat[] = [];
  displayedColumns: string[] = [
    'player_id',
    'goals_scored',
    'yellow_card',
    'red_card',
  ];

  constructor(
    private fb: FormBuilder,
    private teamService: TeamService,
    private leagueService: LeagueService,
    private gameService: GameService,
    private playerStatService: PlayerStatService,
    private cdr: ChangeDetectorRef,
  ) {
    this.leagueAndSeasonFormGroup = this.fb.group({
      league: ['', Validators.required], // League Selection
      season: ['', Validators.required],
    });

    this.teamsFormGroup = this.fb.group({
      team1: ['', Validators.required], // Team 1 Selection
      team2: ['', Validators.required], // Team 2 Selection
    });
  }

  ngOnInit(): void {
    this.fetchLeagues();
    this.team1FilteredOptions = this.teamsFormGroup
      .get('team1')
      ?.valueChanges.pipe(
        startWith(''),
        map((value) => this._filterTeam1(value || '')),
      );
    this.team2FilteredOptions = this.teamsFormGroup
      .get('team2')
      ?.valueChanges.pipe(
        startWith(''),
        map((value) => this._filterTeam2(value || '')),
      );
  }

  fetchTeamsForLeague(league: string, year: number): void {
    this.leagueService.getLeagueTeams(league, year).subscribe({
      next: (data) => {
        const teams = data.map((team: Team) => team.name); // Extract team names once
        this.team1Options = [...teams]; // Independent array for Team 1
        this.team2Options = [...teams]; // Independent array for Team 2
        this.teamsFormGroup.get('team1')?.setValue('');
        this.teamsFormGroup.get('team2')?.setValue('');
      },
      error: (err) => {
        console.error('Error fetching teams for league:', err);
      },
    });
  }

  fetchLeagues(): void {
    this.leagueService.getAllLeagues().subscribe({
      next: (data) => {
        this.leagues = data.map((league: League) => league.name);
      },
      error: (err) => {
        console.error('Error fetching leagues:', err);
      },
    });
  }

  onLeagueAndSeasonNext() {
    const leagueName = this.leagueAndSeasonFormGroup.get('league')?.value;
    const season = this.leagueAndSeasonFormGroup.get('season')?.value;
    if (leagueName && season) {
      this.fetchTeamsForLeague(leagueName, season);
    }
  }

  private _filterTeam1(value: string): string[] {
    const filterValue = value.toLowerCase();
    return this.team1Options.filter((option) =>
      option.toLowerCase().includes(filterValue),
    );
  }

  private _filterTeam2(value: string): string[] {
    const filterValue = value.toLowerCase();
    return this.team2Options.filter((option) =>
      option.toLowerCase().includes(filterValue),
    );
  }

  onTeamsNext() {
    // this.availableGames = []
    this.selectedGame = undefined;
    this.fetchGames();
  }

  fetchGames() {
    const team1 = this.teamsFormGroup.get('team1')?.value || '';
    const team2 = this.teamsFormGroup.get('team2')?.value || '';
    const season = this.leagueAndSeasonFormGroup.get('season')?.value;
    this.gameService.getGames(team1, team2, season).subscribe({
      next: (data) => {
        this.availableGames = data;
      },
    });
  }

  onSelectGameCard(game: Game) {
    this.selectedGame = game;
    this.fetchTeamPlayersForSeason(
      this.selectedGame.team_1_name,
      this.selectedGame.team_2_name,
    );
  }

  get team1Goals(): number {
    return this.team1PlayerStats.reduce(
      (total, stat) => total + (stat.goals_scored || 0),
      0,
    );
  }

  get team2Goals(): number {
    return this.team2PlayerStats.reduce(
      (total, stat) => total + (stat.goals_scored || 0),
      0,
    );
  }

  getPlayerName(playerId: number, team: 'team1' | 'team2'): string {
    // Determine which team to search in
    const playerList = team === 'team1' ? this.team1Players : this.team2Players;
    // Find the player by ID
    const player = playerList.find((player) => player.player_id === playerId);
    // Return the full name or a placeholder if not found
    return player
      ? `${player.first_name} ${player.last_name} \[${player.position_abb}\]`
      : 'Unknown Player';
  }

  fetchTeamPlayersForSeason(team1Name: string, team2Name: string): void {
    // Extracting match date and season from the form
    const season = this.leagueAndSeasonFormGroup.get('season')?.value;
    if (season && this.selectedGame) {
      const team1PlayersRequest = this.teamService.getTeamPlayers(
        team1Name,
        season,
      );
      const team2PlayersRequest = this.teamService.getTeamPlayers(
        team2Name,
        season,
      );
      const date = this.selectedGame.match_date;
      const formattedDate = new Date(date).toISOString().split('T')[0];
      const playerStatRequest = this.playerStatService.getPlayerStats(
        team1Name,
        team2Name,
        formattedDate,
      );

      // Using forkJoin to combine both requests
      forkJoin([
        team1PlayersRequest,
        team2PlayersRequest,
        playerStatRequest,
      ]).subscribe({
        next: ([team1Players, team2Players, psResp]: [
          Player[],
          Player[],
          PlayerStat[],
        ]) => {
          // Storing fetched players
          this.team1Players = [...team1Players];
          this.team2Players = [...team2Players];
          this.selectedGamePlayerStats = psResp;

          // Preparing player stats
          if (this.selectedGame) {
            this.prepareFilledPlayerStats(
              team1Players,
              team2Players,
              team1Name,
              team2Name,
              this.selectedGame.match_date,
            );
          }
        },
        error: (err) => {
          console.error('Error fetching players:', err);
        },
      });
    }

    // Creating requests for team players
  }

  prepareFilledPlayerStats(
    team1Players: Player[],
    team2Players: Player[],
    team1Name: string,
    team2Name: string,
    matchDate: string,
  ) {
    // Prepare stats for Team 1 players
    this.team1PlayerStats = team1Players.map((player) => {
      const stat = this.selectedGamePlayerStats.find(
        (stat) => stat.player_id === player.player_id,
      );
      return {
        player_id: player.player_id,
        team_1_name: team1Name,
        team_2_name: team2Name,
        match_date: matchDate,
        goals_scored: stat?.goals_scored || 0, // Default to 0 if no stat found
        yellow_card: stat?.yellow_card || 0, // Default to 0 if no stat found
        red_card: stat?.red_card || 0, // Default to 0 if no stat found
      };
    });

    // Prepare stats for Team 2 players
    this.team2PlayerStats = team2Players.map((player) => {
      const stat = this.selectedGamePlayerStats.find(
        (stat) => stat.player_id === player.player_id,
      );
      return {
        player_id: player.player_id,
        team_1_name: team1Name,
        team_2_name: team2Name,
        match_date: matchDate,
        goals_scored: stat?.goals_scored || 0, // Default to 0 if no stat found
        yellow_card: stat?.yellow_card || 0, // Default to 0 if no stat found
        red_card: stat?.red_card || 0, // Default to 0 if no stat found
      };
    });

    this.cdr.detectChanges();
  }
}
