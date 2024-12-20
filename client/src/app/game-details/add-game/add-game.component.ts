import {
  ChangeDetectionStrategy,
  ChangeDetectorRef,
  Component,
  OnInit,
} from '@angular/core';
import {
  FormBuilder,
  FormGroup,
  FormsModule,
  ReactiveFormsModule,
  Validators,
} from '@angular/forms';
import { MatInputModule } from '@angular/material/input';
import { MatSelectModule } from '@angular/material/select';
import { LeagueService } from '../../services/league.service';
import { MatFormFieldModule } from '@angular/material/form-field';
import {
  Game,
  League,
  Player,
  PlayerStat,
  Stadium,
  Team,
} from '../../app.models';
import { forkJoin, Observable } from 'rxjs';
import { map, startWith } from 'rxjs/operators';
import { AsyncPipe } from '@angular/common';
import {
  MatAutocomplete,
  MatAutocompleteTrigger,
} from '@angular/material/autocomplete';
import { StadiumService } from '../../services/stadium.service';
import { MatDatepickerModule } from '@angular/material/datepicker';
import { provideNativeDateAdapter } from '@angular/material/core';
import { MatButton } from '@angular/material/button';
import { TeamService } from '../../services/team.service';
import { MatTableModule } from '@angular/material/table';
import { MatCheckboxModule } from '@angular/material/checkbox';
import { MatStepperModule } from '@angular/material/stepper';
import { GameService } from '../../services/game.service';
import { PlayerStatService } from '../../services/player_stat.service';
import { HttpErrorResponse } from '@angular/common/http';

@Component({
  selector: 'app-add-game',
  standalone: true,
  imports: [
    MatFormFieldModule,
    MatSelectModule,
    MatInputModule,
    FormsModule,
    MatAutocomplete,
    MatAutocompleteTrigger,
    AsyncPipe,
    ReactiveFormsModule,
    MatDatepickerModule,
    MatButton,
    MatTableModule,
    MatCheckboxModule,
    MatStepperModule,
  ],
  templateUrl: './add-game.component.html',
  styleUrls: ['./add-game.component.css'],
  providers: [provideNativeDateAdapter()],
  changeDetection: ChangeDetectionStrategy.OnPush,
})
export class AddGameComponent implements OnInit {
  team1Options: string[] = [];
  team2Options: string[] = [];

  team1FilteredOptions: Observable<string[]> | undefined;
  team2FilteredOptions: Observable<string[]> | undefined;

  leagues: string[] = [];

  stadiums: Stadium[] = [];
  selectedStadium: Stadium | undefined;

  attendance: number = 0;

  team1PlayerStats: PlayerStat[] = [];
  team2PlayerStats: PlayerStat[] = [];

  team1Players: Player[] = [];
  team2Players: Player[] = [];

  displayedColumns: string[] = [
    'player_id',
    'goals_scored',
    'yellow_card',
    'red_card',
  ];
  showStatTables = false;

  leagueAndDateFormGroup: FormGroup;
  teamsFormGroup: FormGroup;
  MiscFormGroup: FormGroup;

  errorInsertingGame = false;
  errorMessage = '';

  constructor(
    private leagueService: LeagueService,
    private stadiumService: StadiumService,
    private teamService: TeamService,
    private gameService: GameService,
    private playerStatService: PlayerStatService,
    private cdr: ChangeDetectorRef,
    private fb: FormBuilder,
  ) {
    this.leagueAndDateFormGroup = this.fb.group({
      league: ['', Validators.required], // League Selection
      date: ['', Validators.required],
    });

    this.teamsFormGroup = this.fb.group({
      team1: ['', Validators.required], // Team 1 Selection
      team2: ['', Validators.required], // Team 2 Selection
    });

    this.MiscFormGroup = this.fb.group({
      stadium: ['', Validators.required],
      attendance: ['', Validators.required],
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

  onLeagueAndDateNext() {
    const leagueName = this.leagueAndDateFormGroup.get('league')?.value;
    const season = new Date(
      this.leagueAndDateFormGroup.get('date')?.value,
    ).getFullYear();
    if (leagueName && season) this.fetchTeamsForLeague(leagueName, season);
  }

  onStadiumChange(stadium: Stadium): void {
    this.selectedStadium = stadium;
    this.attendance = stadium.capacity;
    this.MiscFormGroup.get('attendance')?.setValue(this.attendance);
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
    const team1 = this.teamsFormGroup.get('team1')?.value || '';
    const team2 = this.teamsFormGroup.get('team2')?.value || '';
    if (team1 && team2) this.fetchStadiumsForTeams(team1, team2);
  }

  fetchStadiumsForTeams(team1: string, team2: string) {
    this.stadiumService.getStadiumsForTeams(team1, team2).subscribe({
      next: (data) => {
        this.stadiums = data;
      },
    });
  }

  fetchTeamPlayersForSeason(team1Name: string, team2Name: string): void {
    // Extracting match date and season from the form
    const matchDateControl = this.leagueAndDateFormGroup.get('date');
    if (!matchDateControl?.value) {
      console.error('Match date is not available in the form.');
      return;
    }

    const matchDate = new Date(matchDateControl.value).toDateString();
    const season = new Date(matchDateControl.value).getFullYear();

    // Creating requests for team players
    const team1PlayersRequest = this.teamService.getTeamPlayers(
      team1Name,
      season,
    );
    const team2PlayersRequest = this.teamService.getTeamPlayers(
      team2Name,
      season,
    );

    // Using forkJoin to combine both requests
    forkJoin([team1PlayersRequest, team2PlayersRequest]).subscribe({
      next: ([team1Players, team2Players]: [Player[], Player[]]) => {
        // Storing fetched players
        this.team1Players = [...team1Players];
        this.team2Players = [...team2Players];

        // Preparing player stats
        this.prepareEmptyPlayerStats(
          team1Players,
          team2Players,
          team1Name,
          team2Name,
          matchDate,
        );
      },
      error: (err) => {
        console.error('Error fetching players:', err);
      },
    });
  }

  showPlayerStats() {
    const team1 = this.teamsFormGroup.get('team1')?.value || '';
    const team2 = this.teamsFormGroup.get('team2')?.value || '';
    this.showStatTables = true;

    this.fetchTeamPlayersForSeason(team1.toString(), team2.toString());
    setTimeout(() => {
      this.showStatTables = true; // Ensure this happens after arrays are updated
    });
  }

  prepareEmptyPlayerStats(
    team1Players: Player[],
    team2Players: Player[],
    team1Name: string,
    team2Name: string,
    matchDate: string,
  ) {
    // Prepare empty stats for Team 1 players
    this.team1PlayerStats = team1Players.map((player) => ({
      player_id: player.player_id,
      team_1_name: team1Name,
      team_2_name: team2Name,
      match_date: matchDate,
      goals_scored: 0, // Default value
      yellow_card: 0, // Default value
      red_card: 0, // Default value
    }));

    // Prepare empty stats for Team 2 players
    this.team2PlayerStats = team2Players.map((player) => ({
      player_id: player.player_id,
      team_1_name: team1Name,
      team_2_name: team2Name,
      match_date: matchDate,
      goals_scored: 0, // Default value
      yellow_card: 0, // Default value
      red_card: 0, // Default value
    }));
    this.cdr.detectChanges();
  }

  submit() {
    // Extract values from the form controls
    const team_1_name = this.teamsFormGroup.get('team1')?.value;
    const team_2_name = this.teamsFormGroup.get('team2')?.value;
    const stadium = this.MiscFormGroup.get('stadium')?.value;
    const match_date = new Date(this.leagueAndDateFormGroup.get('date')?.value)
      .toISOString()
      .split('T')[0];
    const attendance = this.MiscFormGroup.get('attendance')?.value;
    // Create the game object with the form values
    const game: Game = {
      team_1_name: team_1_name,
      team_2_name: team_2_name,
      stadium_name: stadium['name'],
      match_date: match_date, // Ensure match_date is in 'YYYY-MM-DD' format
      attendance: attendance,
    };
    this.insertGame(game);
    // this.insertPlayerStats(match_date);
  }

  insertGame(game: Game) {
    this.gameService.insertGame(game).subscribe({
      next: (response) => {
        this.errorInsertingGame = false;
        this.errorMessage = '';
        this.insertPlayerStats(game.match_date);
      },
      error: (error: HttpErrorResponse) => {
        this.errorInsertingGame = true;
        this.errorMessage = error.error.error;
      },
    });
  }

  insertPlayerStats(matchDate: string) {
    const payload = this.createPlayerStatPayload(matchDate);
    this.playerStatService.insertPlayerStat(payload).subscribe({
      next: (response) => {},
      error: (error) => {
        console.error('Error inserting Player stat:', error);
      },
    });
  }

  createPlayerStatPayload(matchDate: string): any {
    // Filter team 1 and team 2 player stats where any of the stats are non-zero
    const nonZeroPlayerStats = [
      ...this.team1PlayerStats.filter(
        (stat) => stat.goals_scored + stat.yellow_card + stat.red_card != 0,
      ),
      ...this.team2PlayerStats.filter(
        (stat) => stat.goals_scored + stat.yellow_card + stat.red_card != 0,
      ),
    ];
    nonZeroPlayerStats.filter((stat) => {
      stat.match_date = matchDate;
    });
    return {
      player_stats: nonZeroPlayerStats,
      team_1_name: this.teamsFormGroup.get('team1')?.value,
      team_2_name: this.teamsFormGroup.get('team2')?.value,
      match_date: matchDate,
    };
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
}
