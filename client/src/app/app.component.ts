import { Component } from '@angular/core';
import {RouterLink, RouterOutlet} from '@angular/router';
import {TeamsTableComponent} from "./components/teams-table/teams-table.component";

@Component({
  selector: 'app-root',
  standalone: true,
  imports: [RouterOutlet, RouterLink, TeamsTableComponent],
  templateUrl: './app.component.html',
  styleUrl: './app.component.scss'
})
export class AppComponent {
  title = 'client';
}
