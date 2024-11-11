import { Component, OnInit } from '@angular/core';
import { TeamService } from '../../services/team.service';
import { Team } from '../../models/team';
import {NgForOf, NgIf} from '@angular/common';

@Component({
  selector: 'app-teams-table',
  templateUrl: './teams-table.component.html',
  standalone: true,
  imports: [
    NgIf,
    NgForOf
  ],
  styleUrls: ['./teams-table.component.scss']
})
export class TeamsTableComponent implements OnInit {
  teams: Team[] = [];
  loading: boolean = true;
  error: string | null = null;

  constructor(private teamService: TeamService) { }

  ngOnInit(): void {
    this.loadTeams();
  }

  loadTeams(): void {
    this.teamService.getAllTeams()
      .subscribe({
        next: (data) => {
          console.log('here:', this.teams);
          this.teams = data;
          this.loading = false;
        },
        error: (error) => {
          this.error = 'Failed to load teams';
          this.loading = false;
          console.error('Error loading teams:', error);
        }
      });
  }
}
