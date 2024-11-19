import { Routes } from '@angular/router';

import {LeagueTableComponent} from "./league-table/league-table.component";
import {PlayerDetailsComponent} from "./player-details/player-details.component";
import {TeamDetailsComponent} from "./team-details/team-details.component";
import {PremierLeagueComponent} from "./league-table/premier-league/premier-league.component";
import {LaLigaComponent} from "./league-table/la-liga/la-liga.component";
import {MajorLeagueSoccerComponent} from "./league-table/major-league-soccer/major-league-soccer.component";

export const routes: Routes = [
  { path: 'league-table', component: LeagueTableComponent,
    children: [
      {
        path: 'premier-league', component: PremierLeagueComponent
      },
      {
        path: 'la-liga', component: LaLigaComponent
      },
      {
        path: 'major-league-soccer', component: MajorLeagueSoccerComponent
      }
    ]

  },
  { path: 'player-details', component: PlayerDetailsComponent },
  {path: 'team-details', component: TeamDetailsComponent},

];
