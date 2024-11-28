import { Component } from '@angular/core';
import {BaseLeagueTableComponent} from "../base-league-table/base-league-table.component";

@Component({
  selector: 'app-premier-league',
  standalone: true,
    imports: [
        BaseLeagueTableComponent
    ],
  templateUrl: './premier-league.component.html',
  styleUrl: './premier-league.component.css'
})
export class PremierLeagueComponent {

}
