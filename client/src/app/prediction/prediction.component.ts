import { Component, OnInit } from '@angular/core';
import { LeagueService } from '../services/league.service';
import { PredictionResponse, Team } from '../app.models';
import { Observable } from 'rxjs';
import {
  FormBuilder,
  FormGroup,
  FormsModule,
  ReactiveFormsModule,
  Validators,
} from '@angular/forms';
import { map, startWith } from 'rxjs/operators';
import { AsyncPipe } from '@angular/common';
import { MatFormFieldModule } from '@angular/material/form-field';
import { MatSelectModule } from '@angular/material/select';
import { MatInputModule } from '@angular/material/input';
import {
  MatAutocomplete,
  MatAutocompleteTrigger,
} from '@angular/material/autocomplete';
import { MatButton } from '@angular/material/button';
import { GameService } from '../services/game.service';
import { BaseChartDirective } from 'ng2-charts';
import { Chart, ChartConfiguration, registerables } from 'chart.js';

@Component({
  selector: 'app-prediction',
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
    MatButton,
    BaseChartDirective,
  ],
  templateUrl: './prediction.component.html',
  styleUrl: './prediction.component.css',
})
export class PredictionComponent implements OnInit {
  team1Options: string[] = [];
  team2Options: string[] = [];

  team1FilteredOptions: Observable<string[]> | undefined;
  team2FilteredOptions: Observable<string[]> | undefined;

  teamsFormGroup: FormGroup;

  predictionResponse!: PredictionResponse;

  chartData!: ChartConfiguration['data'];
  chartOptions: ChartConfiguration['options'];

  constructor(
    private leagueService: LeagueService,
    private gameService: GameService,
    private fb: FormBuilder,
  ) {
    Chart.register(...registerables);
    this.teamsFormGroup = this.fb.group({
      home: ['', Validators.required], // Team 1 Selection
      away: ['', Validators.required], // Team 2 Selection
    });
  }

  ngOnInit(): void {
    this.fetchTeamsForLeague();
    this.team1FilteredOptions = this.teamsFormGroup
      .get('home')
      ?.valueChanges.pipe(
        startWith(''),
        map((value) => this._filterTeam1(value || '')),
      );
    this.team2FilteredOptions = this.teamsFormGroup
      .get('away')
      ?.valueChanges.pipe(
        startWith(''),
        map((value) => this._filterTeam2(value || '')),
      );
  }

  fetchTeamsForLeague(league = 'Premier League', year = 2024): void {
    this.leagueService.getLeagueTeams(league, year).subscribe({
      next: (data) => {
        const teams = data.map((team: Team) =>
          team.name.replace('United', 'Utd'),
        ); // Replace 'United' with 'Utd'
        this.team1Options = [...teams]; // Independent array for Team 1
        this.team2Options = [...teams]; // Independent array for Team 2
        this.teamsFormGroup.get('home')?.setValue('');
        this.teamsFormGroup.get('away')?.setValue('');
      },
      error: (err) => {
        console.error(`Error fetching teams for ${league}:`, err);
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

  getPrediction() {
    const team1 = this.teamsFormGroup.get('home')?.value;
    const team2 = this.teamsFormGroup.get('away')?.value;
    this.gameService.predictGame(team1, team2).subscribe({
      next: (data) => {
        this.predictionResponse = data;
        this.setUpChartData();
      },
      error: (err) => {
        console.error('Error predicting game:', err);
      },
    });
  }

  setUpChartData() {
    this.chartData = {
      labels: [
        this.teamsFormGroup.get('home')?.value,
        'Draw',
        this.teamsFormGroup.get('away')?.value,
      ],
      datasets: [
        {
          label: 'Win Percentage',
          data: [
            this.predictionResponse?.probabilities[0],
            this.predictionResponse?.probabilities[1],
            this.predictionResponse?.probabilities[2],
          ],
          backgroundColor: [
            'rgba(54, 162, 235, 0.7)', // Light Blue
            'rgba(255, 206, 86, 0.7)', // Yellow
            'rgba(255, 99, 71, 0.7)', // Tomato Red
          ],
        },
      ],
    };
  }
}
