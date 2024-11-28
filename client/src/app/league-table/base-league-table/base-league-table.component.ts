import {Component, Input, OnChanges, SimpleChanges} from '@angular/core';
import {LeagueService} from '../../services/league.service';
import {LeagueTableRow} from '../../app.models';
import {MatTableModule} from '@angular/material/table';
import {MatSortModule, Sort} from '@angular/material/sort';
import {MatFormField, MatLabel} from '@angular/material/form-field';
import {MatOption} from '@angular/material/core';
import {MatSelect} from '@angular/material/select';
import {FormControl, ReactiveFormsModule} from '@angular/forms';

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
    ReactiveFormsModule
  ],
  templateUrl: './base-league-table.component.html',
  styleUrl: './base-league-table.component.css'
})
export class BaseLeagueTableComponent implements OnChanges {
  @Input() selectedLeagueName = '';
  leagueTable: LeagueTableRow[] = [];
  displayedColumns = [
    'Position',
    'team_name',
    'matches_played',
    'wins',
    'losses',
    'draws',
    'goals_scored',
    'goals_conceded',
    'goal_difference',
    'points'
  ];
  seasons = [2022, 2023, 2024]
  selectedSeason: number = 2024
  constructor(
    private leagueService: LeagueService
  ) {}

  // ngOnInit() {
  //   this.fetchLeagueTable('points', 'DESC');
  // }

  ngOnChanges(changes: SimpleChanges) {
    if (changes['selectedLeagueName'] && changes['selectedLeagueName'].previousValue !== changes['selectedLeagueName'].currentValue) {
      this.fetchLeagueTable('points', 'DESC');
    }
  }

  fetchLeagueTable(sortColumn: string, sortOrder: string) {
    console.log(this.selectedLeagueName);
    this.leagueService.getLeagueTable(this.selectedLeagueName, this.selectedSeason, sortColumn, sortOrder).subscribe({
      next: (data) => {
        this.leagueTable = data;
        console.log(this.leagueTable);
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
  }

}
