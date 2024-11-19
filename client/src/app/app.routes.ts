import { Routes } from '@angular/router';
import { TeamsTableComponent } from './components/teams-table/teams-table.component';
import { PlayerDetailsComponent } from './components/player-details/player-details.component';
import { TeamDetailsComponent } from './components/team-details/team-details.component';

export const routes: Routes = [
    { path: 'teams-table', component: TeamsTableComponent },
    { path: 'player-details', component: PlayerDetailsComponent },
    { path: 'team-details', component: TeamDetailsComponent },
    { path: '', redirectTo: '/teams-table', pathMatch: 'full' }, // Default route
    { path: '**', redirectTo: '/teams-table' } // Catch all route for unfound routes
];
