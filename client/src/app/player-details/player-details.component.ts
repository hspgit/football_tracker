import {Component} from '@angular/core';
import {AsyncPipe, DatePipe, DecimalPipe} from '@angular/common';
import {
  MatAutocompleteModule,
  MatAutocompleteTrigger,
} from '@angular/material/autocomplete';
import {MatFormFieldModule, MatLabel} from '@angular/material/form-field';
import {MatInputModule} from '@angular/material/input';
import {FormControl, ReactiveFormsModule, Validators} from '@angular/forms';
import {debounceTime, distinctUntilChanged, Observable, of, switchMap} from 'rxjs';
import {PlayerService} from '../services/player.service';
import {map, startWith} from 'rxjs/operators';
import {Player, PlayerStatRow} from '../app.models';
import {MatOptionModule} from '@angular/material/core';
import {MatCardModule} from '@angular/material/card';
import {PlayerStatService} from '../services/player_stat.service';
import {BaseChartDirective} from 'ng2-charts';
import {
  Chart,
  registerables,
  ChartConfiguration,
} from 'chart.js';
import {baseTension, calculateAge} from '../app.utils';
import {baseChartConfig} from '../app.utils'

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
  styleUrl: './player-details.component.css'
})

export class PlayerDetailsComponent {


  playerFormControl = new FormControl('', Validators.required);
  playerFilteredOptions: Observable<Player[]> | undefined;
  selectedPlayer: Player | undefined;
  selectedPlayerStats: PlayerStatRow[] | undefined
  chartData!: ChartConfiguration['data'];
  chartOptions: ChartConfiguration['options'];

  constructor(
    private playerService: PlayerService,
    private playerStatService: PlayerStatService
  ) {
    Chart.register(...registerables)
    this.playerFilteredOptions = this.playerFormControl.valueChanges.pipe(
      startWith(''),
      debounceTime(400),
      distinctUntilChanged(),
      switchMap((val) => this.filter(val || ''))
    );
  }

  filter(val: any): Observable<Player[]> {
    if (typeof val === 'string') {
      return this.playerService.getPlayers(val).pipe(
        map((response: Player[]) =>
          response.filter((option) =>
            this.displayFn(option).toLowerCase().includes(val.toLowerCase())
          )
        )
      );
    }
    else return of([]);
  }

  displayFn(playerOption: Player): string {
    return playerOption ? playerOption.first_name + ' ' + playerOption.last_name : '';
  }

  onPlayerSelected(selectedPlayer: Player): void {
    this.selectedPlayer = selectedPlayer;
    this.fetchPlayerStats();
  }

  fetchPlayerStats() {
    if (this.selectedPlayer) {
      this.playerStatService
        .fetchPlayerStatsForSeasons(this.selectedPlayer.player_id, '2022,2023,2024')
        .subscribe({
          next: (resp: PlayerStatRow[]) => {
            // Map the response to ensure the totals are numbers
             this.selectedPlayerStats = resp.map(stat => ({
              ...stat,
              total_goals: Number(stat.total_goals),
              total_reds: Number(stat.total_reds),
              total_yellows: Number(stat.total_yellows)
            }));
            this.setChartData();
          },
          error: (err) => {
            console.error('Error fetching player stats:', err);
          }
        });
    }
  }

  setChartData() {
    const seasons = (this.selectedPlayerStats?.map(stat => stat.season) || []) as number[];
    const totalGoals = (this.selectedPlayerStats?.map(stat => stat.total_goals) || []).map(Number) as number[];
    const totalYellows = (this.selectedPlayerStats?.map(stat => stat.total_yellows) || []).map(Number) as number[];
    const totalReds = (this.selectedPlayerStats?.map(stat => stat.total_reds) || []).map(Number) as number[];

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
        }
      ]
    };
    // @ts-ignore
    this.chartOptions = baseChartConfig;

  }

  protected readonly calculateAge = calculateAge;
}
