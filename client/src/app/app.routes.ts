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
import {HomePageComponent} from './home-page/home-page.component';
import {SponsorDetailsComponent} from './sponsor-details/sponsor-details.component';
import {AddTeamComponent} from './team-details/add-team/add-team.component';
import {ViewTeamComponent} from './team-details/view-team/view-team.component';

export const routes: Routes = [
  {
    path:'home-page',
    component: HomePageComponent
  },
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
    path: 'team-details',
    component: TeamDetailsComponent,
    children: [
      {
        path: 'add-team',
        component: AddTeamComponent
      },
      {
        path: 'view-team',
        component: ViewTeamComponent
      }
    ]
  },
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
  {
    path: 'player-details',
    component: PlayerDetailsComponent },
  {
    path: 'sponsor-details',
    component: SponsorDetailsComponent

  },
  { path: '**', redirectTo: '/home-page', pathMatch: 'full' },

];
