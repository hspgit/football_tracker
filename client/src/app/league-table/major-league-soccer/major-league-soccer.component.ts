import { Component } from '@angular/core';
import {BaseLeagueTableComponent} from '../base-league-table/base-league-table.component';

@Component({
  selector: 'app-major-league-soccer',
  standalone: true,
  imports: [
    BaseLeagueTableComponent
  ],
  templateUrl: './major-league-soccer.component.html',
  styleUrl: './major-league-soccer.component.css'
})
export class MajorLeagueSoccerComponent {

}


