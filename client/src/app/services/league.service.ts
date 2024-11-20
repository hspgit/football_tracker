import { Injectable } from '@angular/core';
import {HttpClient, HttpParams} from '@angular/common/http';
import {Observable} from 'rxjs';
import {League, Team} from "../app.models";

@Injectable({
  providedIn: 'root'
})
export class LeagueService {

  private apiUrl = 'http://localhost:5001/api/leagues';  // API endpoint

  constructor(private http: HttpClient) { }

  getAllLeagues(): Observable<any> {
    // Make the HTTP GET request to the Flask API
    return this.http.get<League[]>(`${this.apiUrl}/all`);
  }

  getLeagueTeams(leagueName: string, season: number): Observable<any> {
    // Prepare the query parameters
    const params = new HttpParams()
      .set('league_name', leagueName)
      .set('season', season.toString());

    // Make the HTTP GET request to the Flask API
    return this.http.get<Team[]>(`${this.apiUrl}/teams`, { params });
  }
}
