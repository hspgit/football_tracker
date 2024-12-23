import { Injectable } from '@angular/core';
import { HttpClient, HttpParams } from '@angular/common/http';
import { catchError, Observable } from 'rxjs';
import {
  insertTeamAndPlayerPayload,
  Player,
  Team,
  TeamDetails,
} from '../app.models';
import { baseUrl } from '../app.utils';

@Injectable({
  providedIn: 'root',
})
export class TeamService {
  private teamsBaseUrl = `${baseUrl}/teams`;

  constructor(private http: HttpClient) {}

  getTeamPlayers(teamName: string, season: number): Observable<Player[]> {
    const params = new HttpParams()
      .set('team_name', teamName)
      .set('season', season.toString());

    return this.http.get<Player[]>(`${this.teamsBaseUrl}/players`, { params });
  }

  getTeams(teamSearchStr: string): Observable<Team[]> {
    const params = new HttpParams().set('team_name', teamSearchStr);
    return this.http.get<Team[]>(`${this.teamsBaseUrl}/all`, { params });
  }

  getTeamDetails(teamName: string, season?: number): Observable<TeamDetails[]> {
    const seasonParam = season ? season : 2024;
    const params = new HttpParams()
      .set('team_name', teamName)
      .set('season', seasonParam);

    return this.http.get<TeamDetails[]>(`${this.teamsBaseUrl}/details`, {
      params,
    });
  }

  insertTeam(payload: insertTeamAndPlayerPayload) {
    return this.http.post<any>(`${this.teamsBaseUrl}/insert`, payload).pipe(
      catchError((error) => {
        throw error;
      }),
    );
  }

  getLastExistingSeason(teamName: string) {
    const params = new HttpParams().set('team_name', teamName);

    return this.http.get<{
      league_name: string;
      season: number;
    }>(`${this.teamsBaseUrl}/latest-season`, { params });
  }

  deleteTeam(teamName: string) {
    const params = new HttpParams().set('team_name', teamName);

    return this.http.delete(`${this.teamsBaseUrl}/delete`, { params });
  }
}
