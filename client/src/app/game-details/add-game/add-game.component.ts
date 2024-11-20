import { Component, OnInit } from '@angular/core';
import {FormsModule, ReactiveFormsModule, FormControl} from '@angular/forms';
import {MatInputModule} from '@angular/material/input';
import {MatSelectModule} from '@angular/material/select';
import {LeagueService} from '../../services/league.service';
import {MatFormFieldModule} from '@angular/material/form-field';
import {League, Team} from '../../app.models';
import {Observable} from 'rxjs';
import {map, startWith} from 'rxjs/operators';
import {AsyncPipe} from '@angular/common';
import {MatAutocomplete, MatAutocompleteModule, MatAutocompleteTrigger} from '@angular/material/autocomplete';


interface DropDownOption {
  value: string;
  viewValue: string;
}

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
    ReactiveFormsModule
  ],
  templateUrl: './add-game.component.html',
  styleUrls: ['./add-game.component.css']
})
export class AddGameComponent implements OnInit {
  options: string[] = [];
  myControl = new FormControl('');
  filteredOptions: Observable<string[]> | undefined;
  leagues: DropDownOption[] = [];
  teams: DropDownOption[] = [];
  selectedLeague: string = '';
  selectedTeam1: string = '';
  selectedTeam2: string = '';
  selectedStadium: string = '';
  selectedBroadcaster: string = '';
  selectedChannel: string = '';
  selectedAttendance: number = 0;

  constructor(private leagueService: LeagueService) {}

  ngOnInit(): void {
    this.fetchLeagues();
    this.fetchStadiums();
    this.filteredOptions = this.myControl.valueChanges.pipe(
      startWith(''),
      map(value => this._filter(value || '')),
    );
  }

  fetchTeamsForLeague(league: string): void {
    this.leagueService.getLeagueTeams(league, 2024).subscribe({
      next: (data) => {
        // this.teams = data.map((team: Team) => ({
        //   value: team.name,
        //   viewValue: team.name
        // }))
        this.options = data.map((team: Team) => team.name); // Map to an array of strings
        console.log(this.options);
        this.myControl.setValue(this.myControl.value || '');
      },
      error: (err) => {
        console.error('Error fetching teams for league:', err);
      }
    });
  }

  fetchLeagues(): void {
    this.leagueService.getAllLeagues().subscribe({
      next: (data) => {
        // Assuming the API returns an array of objects with `League Name` and `Country`
        this.leagues = data.map((league: League) => ({
          value: league.name, // Use appropriate field from API
          viewValue: league.name
        }));
      },
      error: (err) => {
        console.error('Error fetching leagues:', err);
      }
    });
  }

  onLeagueChange(league: string): void {
    console.log('Selected league:', league);
    this.selectedLeague = league;
    this.fetchTeamsForLeague(league);

  }

  onTeam1Change(team1Name: string) {
    console.log(team1Name);
    this.selectedTeam1 = team1Name;
  }

  onTeam2Change(team2Name: string) {
    console.log(team2Name)
    this.selectedTeam2 = team2Name;
  }

   fetchStadiums() {

  }

  private _filter(value: string): string[] {
    const filterValue = value.toLowerCase();

    return this.options.filter(option => option.toLowerCase().includes(filterValue));
  }
}
