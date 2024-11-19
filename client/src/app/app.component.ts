import { Component } from '@angular/core';
import { MatSidenavModule } from '@angular/material/sidenav';
import { MatListModule } from '@angular/material/list';
import {RouterLink, RouterLinkActive, RouterOutlet} from '@angular/router';
import { TeamsTableComponent } from './components/teams-table/teams-table.component';
import {TeamDetailsComponent} from "./components/team-details/team-details.component";
import {PlayerDetailsComponent} from "./components/player-details/player-details.component";

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.scss'],
  standalone: true,
  imports: [
    TeamsTableComponent,
    TeamDetailsComponent,
    PlayerDetailsComponent,
    RouterOutlet,
    RouterLink,
    RouterLinkActive,
    MatSidenavModule,
    MatListModule,
  ]
})
export class AppComponent {
  title = 'client';
}
