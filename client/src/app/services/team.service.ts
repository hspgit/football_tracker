import { Injectable } from '@angular/core';
import { HttpClient, HttpParams } from '@angular/common/http';
import { Observable } from 'rxjs';
import {Player, Team, TeamDetails} from '../app.models';
import {baseUrl} from '../app.utils';

@Injectable({
  providedIn: 'root'
})
export class TeamService {

  private teamsBaseUrl = `${baseUrl}/teams`

  constructor(private http: HttpClient) { }

  getTeamPlayers(teamName: string, season: number): Observable<Player[]> {
    const params = new HttpParams()
      .set('team_name', teamName)
      .set('season', season.toString());

    return this.http.get<Player[]>(`${this.teamsBaseUrl}/players`, { params });
  }

  getTeams(teamSearchStr: string): Observable<Team[]> {
    const params = new HttpParams()
      .set('team_name', teamSearchStr)
    return this.http.get<Team[]>(`${this.teamsBaseUrl}/all`, {params});
  }

  getTeamDetails(teamName: string, season?: number): Observable<TeamDetails[]> {
    const seasonParam = season ? season : 2024
    const params = new HttpParams()
      .set('team_name', teamName)
      .set('season', seasonParam)

    return this.http.get<TeamDetails[]>(`${this.teamsBaseUrl}/details`, {params});
  }

}
