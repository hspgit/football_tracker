import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { AsyncPipe, DatePipe, DecimalPipe } from '@angular/common';
import {
  MatAutocompleteModule,
  MatAutocompleteTrigger,
} from '@angular/material/autocomplete';
import { MatFormFieldModule, MatLabel } from '@angular/material/form-field';
import { MatInputModule } from '@angular/material/input';
import { FormControl, ReactiveFormsModule, Validators } from '@angular/forms';
import {
  catchError,
  debounceTime,
  distinctUntilChanged,
  forkJoin,
  Observable,
  of,
  switchMap,
} from 'rxjs';
import { PlayerService } from '../services/player.service';
import { map, startWith } from 'rxjs/operators';
import { Player, PlayerStatRow } from '../app.models';
import { MatOptionModule } from '@angular/material/core';
import { MatCardModule } from '@angular/material/card';
import { PlayerStatService } from '../services/player_stat.service';
import { BaseChartDirective } from 'ng2-charts';
import { Chart, ChartConfiguration, registerables } from 'chart.js';
import { baseChartConfig, baseTension, calculateAge } from '../app.utils';

@Component({
  selector: 'app-player-details',
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
    MatCardModule,
    DecimalPipe,
    DatePipe,
    BaseChartDirective,
  ],
  templateUrl: './player-details.component.html',
  styleUrl: './player-details.component.css',
})
export class PlayerDetailsComponent implements OnInit {
  playerFormControl = new FormControl('', Validators.required);
  playerFilteredOptions: Observable<Player[]> | undefined;
  selectedPlayer: Player | undefined;
  selectedPlayerStats: PlayerStatRow[] | undefined;
  chartData!: ChartConfiguration['data'];
  chartOptions: ChartConfiguration['options'];
  selectedPlayerTeam = '';
  selectedPlayerSeason = '';

  constructor(
    private playerService: PlayerService,
    private playerStatService: PlayerStatService,
    private route: ActivatedRoute,
    private router: Router,
  ) {
    Chart.register(...registerables);
    this.playerFilteredOptions = this.playerFormControl.valueChanges.pipe(
      startWith(''),
      debounceTime(400),
      distinctUntilChanged(),
      switchMap((val) => this.filter(val || '')),
    );
  }

  ngOnInit() {
    this.route.queryParams.subscribe((params) => {
      const playerId = params['playerId'];
      if (playerId) {
        this.playerService.getPlayerById(playerId).subscribe((player) => {
          if (player) {
            // @ts-ignore
            this.playerFormControl.setValue(player);
            console.log('Setting player form control value:', player);
            this.onPlayerSelected(player);
          }
        });
      }
    });
  }

  filter(val: any): Observable<Player[]> {
    if (typeof val === 'string') {
      return this.playerService
        .getPlayers(encodeURIComponent(val))
        .pipe(
          map((response: Player[]) =>
            response.filter((option) =>
              this.displayFn(option).toLowerCase().includes(val.toLowerCase()),
            ),
          ),
        );
    } else return of([]);
  }

  displayFn(playerOption: Player): string {
    return playerOption
      ? playerOption.first_name + ' ' + playerOption.last_name
      : '';
  }

  setRouteParams(player: Player) {
    console.log('Setting route params for player:', player);
    this.router
      .navigate([], {
        queryParams: { playerId: player.player_id },
        queryParamsHandling: 'merge',
      })
      .then(() => {
        // this.onPlayerSelected(player);
      });
  }

  onPlayerSelected(selectedPlayer: Player): void {
    this.selectedPlayer = selectedPlayer;
    this.fetchPlayerTeam();
    this.fetchPlayerStats();
  }

  fetchPlayerTeam() {
    if (this.selectedPlayer) {
      this.playerService
        .getLatestTeam(this.selectedPlayer?.player_id)
        .subscribe({
          next: (data) => {
            this.selectedPlayerTeam = data['team_name'];
            this.selectedPlayerSeason = data['season'].toString();
          },
        });
    }
  }

  fetchPlayerStats() {
    if (this.selectedPlayer) {
      const playerId = this.selectedPlayer.player_id;

      const observables = [
        this.playerStatService
          .fetchPlayerStatsForSeasons(playerId, '2022')
          .pipe(
            catchError((err) => {
              console.error('Error fetching 2022 player stats:', err);
              return of([]);
            }),
          ),
        this.playerStatService
          .fetchPlayerStatsForSeasons(playerId, '2023')
          .pipe(
            catchError((err) => {
              console.error('Error fetching 2023 player stats:', err);
              return of([]);
            }),
          ),
        this.playerStatService
          .fetchPlayerStatsForSeasons(playerId, '2024')
          .pipe(
            catchError((err) => {
              console.error('Error fetching 2024 player stats:', err);
              return of([]);
            }),
          ),
      ];

      forkJoin(observables)
        .pipe(
          catchError((err) => {
            console.error('Overall error in forkJoin player stats:', err);
            return of([[], [], []]);
          }),
        )
        .subscribe({
          next: (responses) => {
            this.selectedPlayerStats = responses
              .flat()
              .filter((stat) => stat && Object.keys(stat).length > 0)
              .map((stat) => ({
                ...stat,
                total_goals: Number(stat.total_goals),
                total_reds: Number(stat.total_reds),
                total_yellows: Number(stat.total_yellows),
              }));
            this.setChartData();
          },
          error: (err) => {
            console.error('Unexpected error in player stats fetch:', err);
            this.selectedPlayerStats = [];
            this.setChartData();
          },
        });
    } else {
      console.warn('No player selected');
    }
  }

  setChartData() {
    const seasons = (this.selectedPlayerStats?.map((stat) => stat.season) ||
      []) as number[];
    const totalGoals = (
      this.selectedPlayerStats?.map((stat) => stat.total_goals) || []
    ).map(Number) as number[];
    const totalYellows = (
      this.selectedPlayerStats?.map((stat) => stat.total_yellows) || []
    ).map(Number) as number[];
    const totalReds = (
      this.selectedPlayerStats?.map((stat) => stat.total_reds) || []
    ).map(Number) as number[];

    this.chartData = {
      labels: seasons,
      datasets: [
        {
          label: 'Total Goals',
          data: totalGoals,
          tension: baseTension,
          borderColor: 'rgba(75, 192, 192, 1)',
          backgroundColor: 'rgba(75, 192, 192, 0.2)',
          fill: false,
        },
        {
          label: 'Total Yellow Cards',
          data: totalYellows,
          tension: baseTension,
          borderColor: 'rgba(255, 206, 86, 1)',
          backgroundColor: 'rgba(255, 206, 86, 0.2)',
          fill: false,
        },
        {
          label: 'Total Red Cards',
          data: totalReds,
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

  protected readonly calculateAge = calculateAge;
}
