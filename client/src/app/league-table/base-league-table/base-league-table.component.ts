import { Component, Input, OnChanges, SimpleChanges } from '@angular/core';
import { LeagueService } from '../../services/league.service';
import { LeagueTableRow, Player, TopStatRow } from '../../app.models';
import { MatTableModule } from '@angular/material/table';
import { MatSortModule, Sort } from '@angular/material/sort';
import { MatFormField, MatLabel } from '@angular/material/form-field';
import { MatOption } from '@angular/material/core';
import { MatSelect } from '@angular/material/select';
import { FormControl, ReactiveFormsModule } from '@angular/forms';
import { PlayerStatService } from '../../services/player_stat.service';
import { forkJoin } from 'rxjs';
import { NgOptimizedImage } from '@angular/common';

@Component({
  selector: 'app-base-league-table',
  standalone: true,
  imports: [
    MatTableModule,
    MatSortModule,
    MatFormField,
    MatLabel,
    MatOption,
    MatSelect,
    ReactiveFormsModule,
    NgOptimizedImage,
  ],
  templateUrl: './base-league-table.component.html',
  styleUrl: './base-league-table.component.css',
})
export class BaseLeagueTableComponent implements OnChanges {
  @Input() selectedLeagueName = '';
  leagueTable: LeagueTableRow[] = [];
  topLeagueGoal: TopStatRow[] = [];
  topLeagueYellow: TopStatRow[] = [];
  topLeagueRed: TopStatRow[] = [];
  leagueDisplayedColumns = [
    'position',
    'team_name',
    'matches_played',
    'wins',
    'losses',
    'draws',
    'goals_scored',
    'goals_conceded',
    'goal_difference',
    'points',
  ];
  topStatDisplayColumns = [
    'position',
    'player',
    'position_abb',
    'team_name',
    'total_stat',
  ];
  seasons = [2022, 2023, 2024];
  selectedSeason: number = 2024;
  constructor(
    private leagueService: LeagueService,
    private playerStatService: PlayerStatService,
  ) {}

  ngOnChanges(changes: SimpleChanges) {
    if (
      changes['selectedLeagueName'] &&
      changes['selectedLeagueName'].previousValue !==
        changes['selectedLeagueName'].currentValue
    ) {
      this.fetchLeagueTable('points', 'DESC');
      this.fetchTopStats();
    }
  }

  fetchLeagueTable(sortColumn: string, sortOrder: string) {
    this.leagueService
      .getLeagueTable(
        this.selectedLeagueName,
        this.selectedSeason,
        sortColumn,
        sortOrder,
      )
      .subscribe({
        next: (data) => {
          this.leagueTable = data;
        },
        error: (err) => console.error(err),
      });
  }

  onSortChange(sort: Sort) {
    this.fetchLeagueTable(sort.active, sort.direction.toUpperCase());
  }

  onSeasonChange(season: number) {
    this.selectedSeason = season;
    this.fetchLeagueTable('points', 'DESC');
    this.fetchTopStats();
  }

  fetchTopStats() {
    const leagueTopGoalRequest = this.playerStatService.fetchTopStat(
      this.selectedLeagueName,
      this.selectedSeason,
      'goals_scored',
    );
    const leagueTopYellowRequest = this.playerStatService.fetchTopStat(
      this.selectedLeagueName,
      this.selectedSeason,
      'yellow_card',
    );
    const leagueTopRedRequest = this.playerStatService.fetchTopStat(
      this.selectedLeagueName,
      this.selectedSeason,
      'red_card',
    );

    forkJoin([
      leagueTopGoalRequest,
      leagueTopYellowRequest,
      leagueTopRedRequest,
    ]).subscribe({
      next: ([leagueTopGoal, leagueTopYellow, leagueTopRed]) => {
        this.topLeagueGoal = leagueTopGoal.top_stats;
        this.topLeagueYellow = leagueTopYellow.top_stats;
        this.topLeagueRed = leagueTopRed.top_stats;
      },
      error: (err) => {
        console.error('Error fetching players:', err);
      },
    });
  }
}
