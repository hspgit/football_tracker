import { Component, OnInit } from '@angular/core';
import {
  RouterLinkActive,
  RouterOutlet,
  Router,
  NavigationEnd,
  RouterLink,
} from '@angular/router';
import { MatListItem, MatNavList } from '@angular/material/list';
import {
  MatDrawer,
  MatDrawerContainer,
  MatDrawerContent,
  MatSidenav,
  MatSidenavContainer,
  MatSidenavContent,
} from '@angular/material/sidenav';
import { MatButtonModule, MatFabButton } from '@angular/material/button';
import { MatExpansionModule } from '@angular/material/expansion';
import { MatInputModule } from '@angular/material/input';
import {
  MatIconModule,
  MatIconDefaultOptions,
  MAT_ICON_DEFAULT_OPTIONS,
  MatIconRegistry,
} from '@angular/material/icon';

export interface Link {
  name: string;
  href: string;
  isActive: boolean;
  subItems?: Link[];
}

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
    MatExpansionModule,
    MatButtonModule,
    MatIconModule,
  ],
  templateUrl: './app.component.html',
  styleUrl: './app.component.css',
})
export class AppComponent implements OnInit {
  title = 'client';

  links: Link[] = [
    {
      name: 'Home',
      href: '/home-page',
      isActive: false,
    },
    {
      name: 'League Table',
      href: '/league-table',
      isActive: false,
      subItems: [
        {
          name: 'Premier League',
          href: '/league-table/premier-league',
          isActive: false,
        },
        { name: 'La Liga', href: '/league-table/la-liga', isActive: false },
        {
          name: 'Major League Soccer',
          href: '/league-table/major-league-soccer',
          isActive: false,
        },
      ],
    },
    {
      name: 'Team Details',
      href: '/team-details',
      isActive: false,
      subItems: [
        { name: 'Add Team', href: '/team-details/add-team', isActive: false },
        { name: 'View Team', href: '/team-details/view-team', isActive: false },
        {
          name: 'Delete Team',
          href: '/team-details/delete-team',
          isActive: false,
        },
      ],
    },
    {
      name: 'Game Details',
      href: '/game-details',
      isActive: false,
      subItems: [
        { name: 'Add Game', href: '/game-details/add-game', isActive: false },
        { name: 'View Game', href: '/game-details/view-game', isActive: false },
      ],
    },
    {
      name: 'Player Details',
      href: '/player-details',
      isActive: false,
    },
    {
      name: 'Sponsors',
      href: '/sponsor-details',
      isActive: false,
    },
    {
      name: 'Prediction',
      href: '/prediction',
      isActive: false,
    },
  ];

  constructor(
    protected router: Router,
    iconRegistry: MatIconRegistry,
  ) {
    iconRegistry.setDefaultFontSetClass(
      'material-symbols-outlined',
      'mat-ligature-font',
      'blue900',
    );
  }

  ngOnInit() {
    this.router.events.subscribe((event) => {
      if (event instanceof NavigationEnd) {
        this.setActiveLink(this.router.url);
      }
    });
  }

  setActiveLink(activePath: string) {
    this.links.forEach((link) => {
      link.isActive =
        link.href === activePath ||
        (link.subItems?.some((item) => item.href === activePath) ?? false);
    });
  }

  isSubItemActive(subItems: Link[]): boolean {
    return subItems?.some((subItem) => this.router.url === subItem.href);
  }
}
