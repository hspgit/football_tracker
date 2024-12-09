import { Routes } from '@angular/router';

import { LeagueTableComponent } from './league-table/league-table.component';
import { PlayerDetailsComponent } from './player-details/player-details.component';
import { TeamDetailsComponent } from './team-details/team-details.component';
import { PremierLeagueComponent } from './league-table/premier-league/premier-league.component';
import { LaLigaComponent } from './league-table/la-liga/la-liga.component';
import { MajorLeagueSoccerComponent } from './league-table/major-league-soccer/major-league-soccer.component';
import { GameDetailsComponent } from './game-details/game-details.component';
import { AddGameComponent } from './game-details/add-game/add-game.component';
import { ViewGameComponent } from './game-details/view-game/view-game.component';
import { HomePageComponent } from './home-page/home-page.component';
import { SponsorDetailsComponent } from './sponsor-details/sponsor-details.component';
import { AddTeamComponent } from './team-details/add-team/add-team.component';
import { ViewTeamComponent } from './team-details/view-team/view-team.component';
import { DeleteTeamComponent } from './team-details/delete-team/delete-team.component';

export const routes: Routes = [
  {
    path: 'home-page',
    component: HomePageComponent,
    title: 'Football Tracker',
  },
  {
    path: 'league-table',
    component: LeagueTableComponent,
    children: [
      {
        path: 'premier-league',
        component: PremierLeagueComponent,
        title: 'Premier League',
      },
      {
        path: 'la-liga',
        component: LaLigaComponent,
        title: 'La Liga',
      },
      {
        path: 'major-league-soccer',
        component: MajorLeagueSoccerComponent,
        title: 'MLS',
      },
    ],
  },
  {
    path: 'team-details',
    component: TeamDetailsComponent,
    children: [
      {
        path: 'add-team',
        component: AddTeamComponent,
        title: 'Add Team',
      },
      {
        path: 'view-team',
        component: ViewTeamComponent,
        title: 'View Team',
      },
      {
        path: 'delete-team',
        component: DeleteTeamComponent,
        title: 'Delete Team',
      },
    ],
  },
  {
    path: 'game-details',
    component: GameDetailsComponent,
    children: [
      {
        path: 'add-game',
        component: AddGameComponent,
        title: 'Add Game',
      },
      {
        path: 'view-game',
        component: ViewGameComponent,
        title: 'View Game',
      },
    ],
  },
  {
    path: 'player-details',
    component: PlayerDetailsComponent,
    title: 'Player Details',
  },
  {
    path: 'sponsor-details',
    component: SponsorDetailsComponent,
    title: 'Sponsors',
  },
  { path: '**', redirectTo: '/home-page', pathMatch: 'full' },
];
