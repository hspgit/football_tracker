import { Injectable } from '@angular/core';
import {HttpClient, HttpParams} from '@angular/common/http';
import {Observable} from 'rxjs';
import {League, LeagueTableRow, Team} from "../app.models";
import {baseUrl} from '../app.utils';

@Injectable({
  providedIn: 'root'
})
export class LeagueService {

  private leaguesBaseUrl = `${baseUrl}/leagues`

  constructor(private http: HttpClient) { }

  getAllLeagues(): Observable<League[]> {
    // Make the HTTP GET request to the Flask API
    return this.http.get<League[]>(`${this.leaguesBaseUrl}/all`);
  }

  getLeagueTeams(leagueName: string, season: number): Observable<any> {
    // Prepare the query parameters
    const params = new HttpParams()
      .set('league_name', leagueName)
      .set('season', season.toString());

    // Make the HTTP GET request to the Flask API
    return this.http.get<Team[]>(`${this.leaguesBaseUrl}/teams`, { params });
  }

  getLeagueTable(leagueName: string, season: number, sortColumn: string, sortOrder: string): Observable<any> {
    // Prepare the query parameters
    const params = new HttpParams()
      .set('league_name', leagueName)
      .set('season', season.toString())
      .set('sort_column', sortColumn)
      .set('sort_order',sortOrder);

    // Make the HTTP GET request to the Flask API
    return this.http.get<LeagueTableRow[]>(`${this.leaguesBaseUrl}/table`, { params });
  }

  getTeamStats(leagueName: string, teamName: string, season: number): Observable<LeagueTableRow> {
    const params = new HttpParams()
      .set('league_name', leagueName)
      .set('season', season)
      .set('team_name', teamName)

    return this.http.get<LeagueTableRow>(`${this.leaguesBaseUrl}/team_rank`, {params});
  }

  getLeagueStats(leagueName: string, season: number): Observable<LeagueTableRow> {
    const params = new HttpParams()
      .set('league_name', leagueName)
      .set('season', season)

    return this.http.get<LeagueTableRow>(`${this.leaguesBaseUrl}/home`, {params});
  }
}
