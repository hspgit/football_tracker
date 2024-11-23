import { Component, OnInit, ChangeDetectorRef } from '@angular/core';
import {
  FormsModule,
  ReactiveFormsModule,
  FormControl
} from '@angular/forms';
import { MatInputModule } from '@angular/material/input';
import { MatSelectModule } from '@angular/material/select';
import { LeagueService } from '../../services/league.service';
import { MatFormFieldModule } from '@angular/material/form-field';
import {Broadcaster, League, Player, PlayerStat, Stadium, Team} from '../../app.models';
import {combineLatest, forkJoin, Observable} from 'rxjs';
import { map, startWith } from 'rxjs/operators';
import {AsyncPipe, NgIf} from '@angular/common';
import {
  MatAutocomplete,
  MatAutocompleteTrigger,
} from '@angular/material/autocomplete';
import { StadiumService } from '../../services/stadium.service';
import { ChangeDetectionStrategy } from '@angular/core';
import { MatDatepickerModule } from '@angular/material/datepicker';
import { provideNativeDateAdapter } from '@angular/material/core';
import {BroadcasterService} from '../../services/broadcaster.service';
import {MatButton} from '@angular/material/button';
import {MatDividerModule} from '@angular/material/divider';
import {TeamService} from '../../services/team.service';
import {MatTableModule} from '@angular/material/table';
import {MatCheckboxModule} from '@angular/material/checkbox';

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
    MatDividerModule,
    MatTableModule,
    NgIf,
    MatCheckboxModule,
  ],
  templateUrl: './add-game.component.html',
  styleUrls: ['./add-game.component.css'],
  providers: [provideNativeDateAdapter()],
  changeDetection: ChangeDetectionStrategy.OnPush,
})
export class AddGameComponent implements OnInit {
  team1Options: string[] = [];
  team2Options: string[] = [];

  team1FormControl = new FormControl('');
  team2FormControl = new FormControl('');
  dateFormControl = new FormControl();
  broadcasterFormControl = new FormControl();

  team1FilteredOptions: Observable<string[]> | undefined;
  team2FilteredOptions: Observable<string[]> | undefined;

  leagues: string[] = [];
  selectedLeague: string = '';

  selectedTeam1: string = '';
  selectedTeam2: string = '';

  team1Datasource: any;
  team2Datasource: any;

  stadiums: Stadium[] = [];
  selectedStadium: Stadium | undefined;

  attendance: number = 0;
  selectedSeason: number = 2024;

  team1PlayerStats: PlayerStat[] = [];
  team2PlayerStats: PlayerStat[] = [];

  team1Players: Player[] = [];
  team2Players: Player[] = [];

  displayedColumns: string[] = ['player_id', 'goals_scored', 'yellow_card', 'red_card'];
  showStatTables = false;

  broadcasters: Broadcaster[] = [];


  constructor(
    private leagueService: LeagueService,
    private stadiumService: StadiumService,
    private broadcasterService: BroadcasterService,
    private teamService: TeamService,
    private cdr: ChangeDetectorRef
  ) {}

  ngOnInit(): void {
    this.team1FormControl.disable();
    this.team2FormControl.disable();
    this.dateFormControl.disable();
    this.broadcasterFormControl.disable();
    this.fetchLeagues();
    this.fetchBroadcasters();
    this.team1FilteredOptions = this.team1FormControl.valueChanges.pipe(
      startWith(''),
      map((value) => this._filterTeam1(value || '')),
    );
    this.team2FilteredOptions = this.team2FormControl.valueChanges.pipe(
      startWith(''),
      map((value) => this._filterTeam2(value || '')),
    );
    // Subscribe to value changes of both form controls
    this.setupTeamSelectionWatcher();
  }

  setupTeamSelectionWatcher(): void {
    // Combine the values of both form controls
    combineLatest([
      this.team1FormControl.valueChanges,
      this.team2FormControl.valueChanges,
    ]).subscribe(([team1, team2]) => {
      // Check if both teams are selected
      if (team1 && team2) {
        this.fetchStadiums(team1, team2);
      }
    });
  }

  fetchTeamsForLeague(league: string): void {
    this.leagueService.getLeagueTeams(league, 2024).subscribe({
      next: (data) => {
        const teams = data.map((team: Team) => team.name); // Extract team names once
        this.team1Options = [...teams]; // Independent array for Team 1
        this.team2Options = [...teams]; // Independent array for Team 2
        this.team1FormControl.setValue('');
        this.team2FormControl.setValue('');
        this.team1FormControl.enable();
        this.team2FormControl.enable();
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

  onLeagueChange(league: string): void {
    this.selectedLeague = league;
    this.fetchTeamsForLeague(league);
  }

  onStadiumChange(stadium: Stadium): void {
    this.selectedStadium = stadium;
    this.attendance = stadium.capacity;
    this.dateFormControl.enable();
    this.broadcasterFormControl.enable();
  }

  fetchStadiums(team1: string, team2: string) {
    this.stadiumService.getStadiumsForTeams(team1, team2).subscribe({
      next: (data) => {
        this.stadiums = data;
      },
    });
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

  fetchBroadcasters() {
    this.broadcasterService.getAllBroadcasters().subscribe({
      next: data => {
        this.broadcasters = data;
      }
    });
  }

  fetchTeamPlayersForSeason(team1Name: string, team2Name: string) {

    const matchDate = new Date(this.dateFormControl.value).toDateString();
    const selectedSeason = new Date(this.dateFormControl.value).getFullYear();
    const team1PlayersRequest = this.teamService.getTeamPlayers(team1Name, selectedSeason);
    const team2PlayersRequest = this.teamService.getTeamPlayers(team2Name, selectedSeason);

    forkJoin([team1PlayersRequest, team2PlayersRequest]).subscribe(
      ([team1Players, team2Players]: [Player[], Player[]]) => {
        this.team1Players = [...team1Players];
        this.team2Players = [...team2Players];
        this.prepareEmptyPlayerStats(team1Players, team2Players, team1Name, team2Name, matchDate);
      },
      error => {
        console.error('Error fetching players:', error);
      }
    );
  }

  showPlayerStats() {
    this.showStatTables = true;
    const team1 = this.team1FormControl.value ?? '';
    const team2 = this.team2FormControl.value ?? '';

    console.log('Fetching player stats for teams:', team1, team2);

    this.fetchTeamPlayersForSeason(team1.toString(), team2.toString());
    setTimeout(() => {
      this.showStatTables = true; // Ensure this happens after arrays are updated
    });
  }

  prepareEmptyPlayerStats(team1Players: Player[], team2Players: Player[], team1Name: string, team2Name: string, matchDate: string) {
    // Prepare empty stats for Team 1 players
    this.team1PlayerStats = team1Players.map(player => ({
      player_id: player.player_id,
      team_1_name: team1Name,
      team_2_name: team2Name,
      match_date: matchDate,
      goals_scored: 0, // Default value
      yellow_card: 0,  // Default value
      red_card: 0      // Default value
    }));

    // Prepare empty stats for Team 2 players
    this.team2PlayerStats = team2Players.map(player => ({
      player_id: player.player_id,
      team_1_name: team1Name,
      team_2_name: team2Name,
      match_date: matchDate,
      goals_scored: 0, // Default value
      yellow_card: 0,  // Default value
      red_card: 0      // Default value
    }));

    console.log('1111', this.team1PlayerStats);
    console.log('2222', this.team2PlayerStats);
    this.cdr.detectChanges();
  }

  submitPlayerStats() {
    console.log('ss11', this.team1PlayerStats);
    console.log('22sss', this.team2PlayerStats);
  }

  getPlayerName(playerId: number, team: 'team1' | 'team2'): string {
    // Determine which team to search in
    const playerList = team === 'team1' ? this.team1Players : this.team2Players;

    // Find the player by ID
    const player = playerList.find(player => player.player_id === playerId);

    // Return the full name or a placeholder if not found
    return player ? `${player.first_name} ${player.last_name}` : 'Unknown Player';
  }

}
