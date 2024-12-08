import { Component } from '@angular/core';
import { AsyncPipe, DatePipe, DecimalPipe } from '@angular/common';
import {
  MatAutocompleteModule,
  MatAutocompleteTrigger,
} from '@angular/material/autocomplete';
import { MatFormFieldModule, MatLabel } from '@angular/material/form-field';
import { MatInputModule } from '@angular/material/input';
import { FormControl, ReactiveFormsModule, Validators } from '@angular/forms';
import { MatOptionModule } from '@angular/material/core';
import { TeamService } from '../../services/team.service';
import { LeagueTableRow, Team, TeamDetails } from '../../app.models';
import {
  catchError,
  debounceTime,
  distinctUntilChanged,
  forkJoin,
  Observable,
  of,
  switchMap,
} from 'rxjs';
import { map, startWith } from 'rxjs/operators';
import { MatCardModule } from '@angular/material/card';
import { calculateAge } from '../../app.utils';
import { LeagueService } from '../../services/league.service';
import { MatButtonModule } from '@angular/material/button';

@Component({
  selector: 'app-team-details',
  standalone: true,
  imports: [
    AsyncPipe,
    MatAutocompleteModule,
    MatAutocompleteTrigger,
    MatFormFieldModule,
    MatInputModule,
    MatLabel,
    MatOptionModule,
    ReactiveFormsModule,
    DatePipe,
    DecimalPipe,
    MatCardModule,
    MatButtonModule,
  ],
  templateUrl: './delete-team.component.html',
  styleUrl: './delete-team.component.css',
})
export class DeleteTeamComponent {
  teamFormControl = new FormControl('', Validators.required);
  teamFilteredOptions: Observable<Team[]> | undefined;
  selectedTeam!: Team;
  selectedTeamDetails!: TeamDetails;
  selectedTeamPlayers = '';
  lastExistingSeason = 0;
  successMessage = '';

  constructor(
    private teamsService: TeamService,
    private leagueService: LeagueService,
  ) {
    this.teamFilteredOptions = this.teamFormControl.valueChanges.pipe(
      startWith(''),
      debounceTime(400),
      distinctUntilChanged(),
      switchMap((val) => this.filter(val || '')),
    );
  }

  displayFn(teamOption: Team): string {
    return teamOption
      ? teamOption.name + ' (' + teamOption.established_year + ')'
      : '';
  }

  filter(val: any): Observable<Team[]> {
    if (typeof val === 'string') {
      return this.teamsService
        .getTeams(val)
        .pipe(
          map((response: Team[]) =>
            response.filter((option) =>
              this.displayFn(option).toLowerCase().includes(val.toLowerCase()),
            ),
          ),
        );
    } else return of([]);
  }

  onTeamSelected(selectedTeam: Team): void {
    this.selectedTeam = selectedTeam;
    this.successMessage = '';
    this.getLastExistingSeason();
  }

  getLastExistingSeason() {
    this.teamsService.getLastExistingSeason(this.selectedTeam.name).subscribe({
      next: (data) => {
        this.lastExistingSeason = data.season;
        this.fetchTeamDetails();
        this.fetchTeamPlayers();
      },
    });
  }

  fetchTeamDetails() {
    if (this.selectedTeam) {
      this.teamsService
        .getTeamDetails(this.selectedTeam.name, this.lastExistingSeason)
        .subscribe({
          next: (data) => {
            this.selectedTeamDetails = data[0];
          },
        });
    }
  }

  fetchTeamPlayers() {
    if (this.selectedTeam) {
      this.teamsService
        .getTeamPlayers(this.selectedTeam.name, this.lastExistingSeason)
        .subscribe({
          next: (resp) => {
            // Join the player details into a single string
            this.selectedTeamPlayers = resp
              .map(
                (player) =>
                  `${player.first_name} ${player.last_name} (${player.position_abb})`,
              )
              .join(', ');
          },
          error: (err) => {
            console.error('Failed to fetch team players:', err);
            this.selectedTeamPlayers = ''; // Clear in case of error
          },
        });
    }
  }

  deleteTeam() {
    console.log(this.selectedTeam.name);
    this.successMessage = '';
    this.teamsService.deleteTeam(this.selectedTeam.name).subscribe({
      next: (data) => {
        this.successMessage =
          'Team Deleted Successfully, Navigate to league table to check.';
      },
      error: (err) => {
        this.successMessage = 'Failed to delete Team:' + err;
      },
    });
  }

  protected readonly calculateAge = calculateAge;
}
