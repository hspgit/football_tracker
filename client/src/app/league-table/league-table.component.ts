import { Component } from '@angular/core';
import { RouterOutlet } from '@angular/router';

@Component({
  selector: 'app-league-table',
  standalone: true,
  imports: [RouterOutlet],
  templateUrl: './league-table.component.html',
  styleUrl: './league-table.component.css',
})
export class LeagueTableComponent {}
