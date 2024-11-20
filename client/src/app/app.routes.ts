import { Routes } from '@angular/router';

import {LeagueTableComponent} from "./league-table/league-table.component";
import {PlayerDetailsComponent} from "./player-details/player-details.component";
import {TeamDetailsComponent} from "./team-details/team-details.component";
import {PremierLeagueComponent} from "./league-table/premier-league/premier-league.component";
import {LaLigaComponent} from "./league-table/la-liga/la-liga.component";
import {MajorLeagueSoccerComponent} from "./league-table/major-league-soccer/major-league-soccer.component";
import {GameDetailsComponent} from './game-details/game-details.component';
import {AddGameComponent} from './game-details/add-game/add-game.component';
import {ViewGameComponent} from './game-details/view-game/view-game.component';

export const routes: Routes = [
  {
    path: 'league-table',
    component: LeagueTableComponent,
    children: [
      {
        path: 'premier-league',
        component: PremierLeagueComponent
      },
      {
        path: 'la-liga',
        component: LaLigaComponent
      },
      {
        path: 'major-league-soccer',
        component: MajorLeagueSoccerComponent
      }
    ]

  },
  {
    path: 'player-details',
    component: PlayerDetailsComponent },
  {
    path: 'team-details',
    component: TeamDetailsComponent},
  {
    path: 'game-details',
    component: GameDetailsComponent,
    children: [
      {
        path: 'add-game',
        component: AddGameComponent
      },
      {
        path: 'view-game',
        component: ViewGameComponent
      }
    ]
  },

];
