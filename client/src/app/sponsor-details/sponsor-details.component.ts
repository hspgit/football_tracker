import { Component, OnInit, inject, Inject } from '@angular/core';
import { MatFormFieldModule } from '@angular/material/form-field';
import { MatSelectModule } from '@angular/material/select';
import { MatInputModule } from '@angular/material/input';
import { FormControl, FormsModule, ReactiveFormsModule } from '@angular/forms';
import { DatePipe, UpperCasePipe } from '@angular/common';
import { MatButton, MatButtonModule } from '@angular/material/button';
import { MatCardModule } from '@angular/material/card';
import { League, Sponsor, SponsorLeague } from '../app.models';
import { SponsorService } from '../services/sponsor.service';
import { LeagueService } from '../services/league.service';
import {
  MatDialog,
  MAT_DIALOG_DATA,
  MatDialogModule,
  MatDialogRef,
} from '@angular/material/dialog';
import { MatIconModule } from '@angular/material/icon';
import { MatDivider, MatDividerModule } from '@angular/material/divider';

export interface DialogData {
  animal: 'panda' | 'unicorn' | 'lion';
}

@Component({
  selector: 'app-sponsor-details',
  standalone: true,
  imports: [
    MatFormFieldModule,
    MatSelectModule,
    MatInputModule,
    ReactiveFormsModule,
    DatePipe,
    MatButton,
    MatCardModule,
    MatIconModule,
    MatButtonModule,
  ],
  templateUrl: './sponsor-details.component.html',
  styleUrl: './sponsor-details.component.css',
})
export class SponsorDetailsComponent implements OnInit {
  sponsors: Sponsor[] = [];
  leagues: string[] = [];
  selectedLeagues = '';
  leagueFormControl = new FormControl();
  dialog = inject(MatDialog);
  selectedSponsor!: Sponsor;
  selectedSponsorMap: { [key: string]: number } = {};
  addSponsorObj!: Sponsor;
  addSponsorMap: { [key: string]: number } = {};

  constructor(
    private sponsorService: SponsorService,
    private leagueService: LeagueService,
  ) {}

  ngOnInit() {
    this.getAllLeagues();
  }

  getAllLeagues() {
    this.leagueService.getAllLeagues().subscribe({
      next: (data: League[]) => {
        this.leagues = data.map((league: League) => league.name);
        this.getAllSponsors();
      },
    });
  }

  getAllSponsors() {
    this.sponsorService.getAllSponsors(this.selectedLeagues).subscribe({
      next: (resp: Sponsor[]) => {
        this.sponsors = resp;
      },
    });
  }

  onLeagueChange(value: string[]) {
    this.selectedLeagues = value.join(',');
    console.log('blank', this.selectedLeagues);
    this.getAllSponsors();
  }

  deleteSponsor(sponsor: Sponsor) {
    this.sponsorService.deleteSponsor(sponsor.name).subscribe({
      next: (resp: Sponsor[]) => {
        this.getAllSponsors();
      },
    });
  }

  viewSponsor(sponsor: Sponsor) {
    this.selectedSponsor = sponsor;
    this.fetSponsorLeagueDetails();
  }

  editSponsor(sponsor: Sponsor) {
    this.selectedSponsor = sponsor;
    this.fetSponsorLeagueDetails(false);
  }

  fetSponsorLeagueDetails(viewMode = true) {
    this.sponsorService
      .fetchSponsorDetails(this.selectedSponsor.name)
      .subscribe({
        next: (resp: SponsorLeague[]) => {
          // Clear the map before populating it
          this.selectedSponsorMap = {};

          // Populate the map
          resp.forEach((el) => {
            this.selectedSponsorMap[el.league_name] = el.sponsorship_amount;
          });
          console.log('map', this.selectedSponsorMap);
          this.openDialog(viewMode);
        },
        error: (err) => {
          console.error('Failed to fetch sponsor league details:', err);
        },
      });
  }

  addSponsor() {
    console.log('addSponsor');
    if (
      this.addSponsorObj.name &&
      this.addSponsorObj.country &&
      this.addSponsorObj.website_url
    ) {
      this.insertSponsor();
    }
  }

  insertSponsor() {
    this.sponsorService.createSponsor(this.addSponsorObj).subscribe({
      next: (data) => {
        console.log('SSponsor created successfully');
        this.updateSponsorshipDetail(
          this.addSponsorObj.name,
          this.addSponsorMap,
        );
      },
      error: (err) => {
        console.error('Error creating sponsor', err);
      },
    });
  }

  updateSponsorshipDetail(
    sponsorName: string,
    dataMap: { [key: string]: number },
  ) {
    const payload: SponsorLeague[] = [];

    // Iterate over the mapData object to create the payload
    for (const leagueName in dataMap) {
      if (dataMap.hasOwnProperty(leagueName)) {
        const sponsorshipAmount = dataMap[leagueName];

        // Create a new object with sponsor_name, league_name, and sponsorship_amount
        console.log(sponsorshipAmount);
        if (sponsorshipAmount !== null && sponsorshipAmount >= 0) {
          payload.push({
            sponsor_name: sponsorName,
            league_name: leagueName,
            sponsorship_amount: sponsorshipAmount,
          });
        }
      }
    }
    if (payload.length) {
      this.sponsorService.updateSponsorLeagueDetails(payload).subscribe({
        next: (data) => {
          this.getAllSponsors();
        },
        error: (err) => {
          console.error('Error updating sponsorship details', err);
        },
      });
    } else {
      this.getAllSponsors();
    }
  }

  openDialog(viewMode = true) {
    const dialogRef = this.dialog.open(DialogBox, {
      disableClose: true,
      width: '800px',
      data: {
        leagues: this.leagues,
        sponsorName: this.selectedSponsor.name,
        mapData: this.selectedSponsorMap,
        viewMode: viewMode,
      },
    });

    dialogRef.afterClosed().subscribe((result) => {
      if (result !== undefined) {
        if (!viewMode) {
          this.updateSponsorshipDetail(
            this.selectedSponsor.name,
            this.selectedSponsorMap,
          );
        }
      }
    });
  }

  openAddSponsorDialog() {
    this.addSponsorObj = {
      name: '',
      country: '',
      website_url: '',
      industry: '',
    };
    this.addSponsorMap = {};
    const dialogRef = this.dialog.open(DialogBox2, {
      width: '800px',
      disableClose: true,
      data: {
        leagues: this.leagues,
        sponsor: this.addSponsorObj,
        mapData: this.addSponsorMap,
      },
    });

    dialogRef.afterClosed().subscribe((result) => {
      if (result) {
        this.addSponsor();
      }
    });
  }
}

@Component({
  selector: 'app-dialog-box',
  templateUrl: './edit-sponsor-dialog-box.html',
  styleUrl: './sponsor-details.component.css',
  imports: [MatDialogModule, MatButtonModule, MatInputModule, FormsModule],
  standalone: true,
})
export class DialogBox {
  constructor(
    public dialogRef: MatDialogRef<DialogBox>,
    @Inject(MAT_DIALOG_DATA) public data: any,
  ) {}

  onClickCancel() {
    this.dialogRef.close();
  }
}

@Component({
  selector: 'app-dialog-box-2',
  templateUrl: './add-sponsor-dialog-box.html',
  styleUrl: './sponsor-details.component.css',
  imports: [
    MatDialogModule,
    MatButtonModule,
    MatInputModule,
    FormsModule,
    MatDividerModule,
  ],
  standalone: true,
})
export class DialogBox2 {
  constructor(
    public dialogRef2: MatDialogRef<DialogBox2>,
    @Inject(MAT_DIALOG_DATA) public data: any,
  ) {}

  onClickCancel() {
    this.dialogRef2.close();
  }
}
