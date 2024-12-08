import { Component, OnInit } from '@angular/core';
import {
  FormArray,
  FormBuilder,
  FormGroup,
  ReactiveFormsModule,
  Validators,
} from '@angular/forms';
import { MatStepperModule } from '@angular/material/stepper';
import { MatDatepickerModule } from '@angular/material/datepicker';
import { MatError, MatFormFieldModule } from '@angular/material/form-field';
import { MatInputModule } from '@angular/material/input';
import { MatOptionModule } from '@angular/material/core';
import { MatSelectModule } from '@angular/material/select';
import { insertTeamAndPlayerPayload, League } from '../../app.models';
import { LeagueService } from '../../services/league.service';
import { MatButtonModule } from '@angular/material/button';
import { TeamService } from '../../services/team.service';

@Component({
  selector: 'app-add-team',
  standalone: true,
  imports: [
    MatStepperModule,
    MatDatepickerModule,
    MatFormFieldModule,
    MatInputModule,
    MatOptionModule,
    MatSelectModule,
    ReactiveFormsModule,
    MatButtonModule,
    MatError,
  ],
  templateUrl: './add-team.component.html',
  styleUrl: './add-team.component.css',
})
export class AddTeamComponent implements OnInit {
  leagueAndSeasonFormGroup: FormGroup;
  teamFormGroup: FormGroup;
  stadiumFormGroup: FormGroup;
  playersFormGroup: FormGroup;
  managerFormControl: FormGroup;
  leagues: string[] = [];
  seasons: number[] = [2022, 2023, 2024];
  errorMessage = '';
  payload!: insertTeamAndPlayerPayload;

  constructor(
    private fb: FormBuilder,
    private leagueService: LeagueService,
    private teamService: TeamService,
  ) {
    this.leagueAndSeasonFormGroup = this.fb.group({
      league: ['', Validators.required], // League Selection
      season: ['', Validators.required],
    });
    this.teamFormGroup = this.fb.group({
      name: ['', Validators.required],
      established_year: ['', Validators.required],
      players: this.fb.array([]),
    });
    this.stadiumFormGroup = this.fb.group({
      name: ['', Validators.required],
      city: ['', Validators.required],
      zip_code: ['', Validators.required],
      capacity: ['', Validators.required],
    });
    this.managerFormControl = this.fb.group({
      first_name: ['', Validators.required],
      last_name: ['', Validators.required],
      dob: ['', Validators.required],
      nationality: ['', Validators.required],
    });
    this.playersFormGroup = this.fb.group({
      players: this.fb.array(this.createInitialPlayers()),
    });
  }

  ngOnInit() {
    this.fetchLeagues();
  }

  createInitialPlayers(): FormGroup[] {
    const players: FormGroup[] = [];
    for (let i = 0; i < 11; i++) {
      players.push(this.createPlayerForm());
    }
    return players;
  }

  // Getter for players form array
  get players(): FormArray {
    return this.playersFormGroup.get('players') as FormArray;
  }

  // Create individual player form group
  createPlayerForm(): FormGroup {
    return this.fb.group({
      first_name: ['', Validators.required],
      last_name: ['', Validators.required],
      dob: ['', [Validators.required]],
      nationality: ['', Validators.required],
      market_value: ['', [Validators.required, Validators.min(0)]],
      jersey_number: [
        '',
        [Validators.required, Validators.min(1), Validators.max(99)],
      ],
      position_abb: ['', Validators.required],
    });
  }

  fetchLeagues(): void {
    this.leagueService.getAllLeagues().subscribe({
      next: (data) => {
        this.leagues = data.map((league: League) => league.name);
      },
      error: (err) => {
        console.error('Error fetching leagues:', err);
      },
    });
  }

  submit() {
    this.payload = {
      leagueName: '',
      seasons: [],
      team: {
        name: '',
        established_year: '',
      },
      stadium: {
        name: '',
        city: '',
        zip_code: '',
        capacity: 0,
      },
      manager: {
        first_name: '',
        last_name: '',
        dob: '',
        nationality: '',
      },
      players: [],
    };
    this.payload.leagueName =
      this.leagueAndSeasonFormGroup.get('league')?.value;
    this.payload.seasons = this.leagueAndSeasonFormGroup.get('season')?.value;
    this.payload.team.name = this.teamFormGroup.get('name')?.value;
    this.payload.team.established_year =
      this.teamFormGroup.get('established_year')?.value;
    this.payload.stadium.name = this.stadiumFormGroup.get('name')?.value;
    this.payload.stadium.capacity =
      this.stadiumFormGroup.get('capacity')?.value;
    this.payload.stadium.city = this.stadiumFormGroup.get('city')?.value;
    this.payload.stadium.zip_code =
      this.stadiumFormGroup.get('zip_code')?.value;
    this.payload.manager.first_name =
      this.managerFormControl.get('first_name')?.value;
    this.payload.manager.last_name =
      this.managerFormControl.get('last_name')?.value;
    this.payload.manager.dob = this.managerFormControl.get('dob')?.value;
    this.payload.manager.nationality =
      this.managerFormControl.get('nationality')?.value;
    this.payload.players = this.players.controls.map(
      (playerForm) => playerForm.value,
    );

    console.log('Payload:', this.payload);
    this.insertDetails();
  }

  insertDetails() {
    this.errorMessage = '';
    this.teamService.insertTeam(this.payload).subscribe({
      next: (data) => {
        this.errorMessage = '';
        console.log('All details inserted successfully', data);
      },
      error: (err) => {
        this.errorMessage = err;
        console.error('Error inserting details:', err);
      },
      complete: () => {
        console.log('Insert operation completed.');
      },
    });
  }
}
