import { Injectable } from '@angular/core';
import { HttpClient, HttpParams } from '@angular/common/http';
import { Observable } from 'rxjs';
import { Stadium } from '../app.models';
import { baseUrl } from '../app.utils';

@Injectable({
  providedIn: 'root',
})
export class StadiumService {
  private stadiumsBaseUrl = `${baseUrl}/stadiums`;

  constructor(private http: HttpClient) {}

  getAllStadiums(): Observable<any> {
    return this.http.get<Stadium[]>(`${this.stadiumsBaseUrl}/all`);
  }

  getStadiumsForTeams(team1Name: string, team2Name: string): Observable<any> {
    const teamNamesList = `${team1Name},${team2Name}`;
    const params = new HttpParams().set('team_names', teamNamesList);

    return this.http.get<Stadium[]>(`${this.stadiumsBaseUrl}/byTeams`, {
      params,
    });
  }
}
