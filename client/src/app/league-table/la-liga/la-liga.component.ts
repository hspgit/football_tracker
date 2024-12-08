import { Component } from '@angular/core';
import { BaseLeagueTableComponent } from '../base-league-table/base-league-table.component';

@Component({
  selector: 'app-la-liga',
  standalone: true,
  imports: [BaseLeagueTableComponent],
  templateUrl: './la-liga.component.html',
  styleUrl: './la-liga.component.css',
})
export class LaLigaComponent {}
