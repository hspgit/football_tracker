import { Component } from '@angular/core';
import {RouterLinkActive, RouterOutlet, Router, NavigationEnd, RouterLink} from '@angular/router';
import {MatListItem, MatNavList} from '@angular/material/list'
import {
  MatDrawer,
  MatDrawerContainer,
  MatDrawerContent,
  MatSidenav,
  MatSidenavContainer,
    MatSidenavContent,
} from "@angular/material/sidenav";
import {MatFabButton} from "@angular/material/button";
import {MatExpansionModule} from '@angular/material/expansion';


@Component({
  selector: 'app-root',
  standalone: true,
  imports: [
      RouterOutlet,
    MatNavList,
    MatDrawerContainer,
    MatDrawerContent,
    MatDrawer,
    MatSidenavContainer,
    MatSidenav,
    MatListItem,
    MatSidenavContent,
    MatFabButton,
    RouterLinkActive,
    RouterLink,
      MatExpansionModule

  ],
  templateUrl: './app.component.html',
  styleUrl: './app.component.css'
})
export class AppComponent {
  title = 'client';

  links = [
    {
      name: "League Table",
      href: '/league-table',
      isActive: false,
      subItems: [
        {
          name: 'Premier League', href: '/league-table/premier-league'
        },
        {
          name: 'La Liga', href: '/league-table/la-liga'
        },
        {
          name: 'Major League Soccer', href: '/league-table/major-league-soccer'
        }
      ]
    },
    {
      name: "Team Details",
      href: '/team-details',
      isActive: false
    },
    {
      name: "Player Details",
      href: '/player-details',
      isActive: false
    },
    {
      name: "Game Details",
      href: '/game-details',
      isActive: false,
      subItems: [
        {
          name: 'Add Game', href: '/game-details/add-game'
        },
        {
          name: 'View Game', href: '/game-details/view-game'
        }
      ]
    }
  ]

  constructor(protected router: Router) {
  }

  ngOnInit() {
    this.router.events.subscribe(event => {
      if (event instanceof NavigationEnd) {
        this.setActiveLink(this.router.url);
      }
    });
  }

  setActiveLink(activePath: string) {
    this.links.forEach(link => {
      link.isActive = link.href === activePath ||
          (link.subItems?.some(item => item.href === activePath) ?? false);
    })
  }
}


