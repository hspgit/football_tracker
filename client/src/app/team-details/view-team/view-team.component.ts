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
import { baseChartConfig, baseTension, calculateAge } from '../../app.utils';
import { LeagueService } from '../../services/league.service';
import { Chart, ChartConfiguration, registerables } from 'chart.js';
import { BaseChartDirective } from 'ng2-charts';

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
    BaseChartDirective,
  ],
  templateUrl: './view-team.component.html',
  styleUrl: './view-team.component.css',
})
export class ViewTeamComponent {
  teamFormControl = new FormControl('', Validators.required);
  teamFilteredOptions: Observable<Team[]> | undefined;
  selectedTeam!: Team;
  selectedTeamDetails!: TeamDetails;
  selectedTeamPlayers = '';
  selectedTeamStats: LeagueTableRow[] = [];
  chartData!: ChartConfiguration['data'];
  chartOptions: ChartConfiguration['options'];
  lastExistingSeason = 0;

  constructor(
    private teamsService: TeamService,
    private leagueService: LeagueService,
  ) {
    Chart.register(...registerables);
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

  fetchTeamStats() {
    if (this.selectedTeamDetails && this.selectedTeam) {
      const leagueName = this.selectedTeamDetails.league_name;
      const teamName = this.selectedTeam.name;

      // Create an array of observables for each year, wrapped with catchError
      const observables = [
        this.leagueService.getTeamStats(leagueName, teamName, 2022).pipe(
          catchError((err) => {
            console.error('Error fetching 2022 stats:', err);
            return of([]); // Return empty array to continue the chain
          }),
        ),
        this.leagueService.getTeamStats(leagueName, teamName, 2023).pipe(
          catchError((err) => {
            console.error('Error fetching 2023 stats:', err);
            return of([]); // Return empty array to continue the chain
          }),
        ),
        this.leagueService.getTeamStats(leagueName, teamName, 2024).pipe(
          catchError((err) => {
            console.error('Error fetching 2024 stats:', err);
            return of([]); // Return empty array to continue the chain
          }),
        ),
      ];

      // Use forkJoin with catchError
      forkJoin(observables)
        .pipe(
          catchError((err) => {
            console.error('Overall error in forkJoin:', err);
            return of([[], [], []]); // Fallback to empty arrays
          }),
        )
        .subscribe({
          next: (responses) => {
            // Combine the results into selectedTeamStats
            this.selectedTeamStats = responses.flat();
            this.setChartData();
          },
          error: (err) => {
            console.error('Unexpected error:', err);
            // Optional: Set a default or empty state
            this.selectedTeamStats = [];
            this.setChartData();
          },
        });
    } else {
      console.warn('Selected team details or team name is missing.');
    }
  }

  setChartData() {
    const seasons = (this.selectedTeamStats?.map((stat) => stat.season) ||
      []) as number[];
    const rank = (this.selectedTeamStats?.map((stat) => stat.team_rank) ||
      []) as number[];
    const points = (this.selectedTeamStats?.map((stat) => stat.points) ||
      []) as number[];
    const goalsScored = (this.selectedTeamStats?.map(
      (stat) => stat.goals_scored,
    ) || []) as number[];

    this.chartData = {
      labels: seasons,
      datasets: [
        {
          label: 'Rank',
          data: rank,
          tension: baseTension,
          borderColor: 'rgba(75, 192, 192, 1)',
          backgroundColor: 'rgba(75, 192, 192, 0.2)',
          fill: false,
        },
        {
          label: 'Points',
          data: points,
          tension: baseTension,
          borderColor: 'rgba(255, 206, 86, 1)',
          backgroundColor: 'rgba(255, 206, 86, 0.2)',
          fill: false,
        },
        {
          label: 'Goals Scored',
          data: goalsScored,
          tension: baseTension,
          borderColor: 'rgba(255, 99, 132, 1)',
          backgroundColor: 'rgba(255, 99, 132, 0.2)',
          fill: false,
        },
      ],
    };

    // @ts-ignore
    this.chartOptions = baseChartConfig;
  }

  fetchTeamDetails() {
    if (this.selectedTeam) {
      this.teamsService
        .getTeamDetails(this.selectedTeam.name, this.lastExistingSeason)
        .subscribe({
          next: (data) => {
            this.selectedTeamDetails = data[0];
            this.fetchTeamStats();
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

  protected readonly calculateAge = calculateAge;
}
