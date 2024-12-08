import { Injectable } from '@angular/core';
import { HttpClient, HttpParams } from '@angular/common/http';
import { catchError, Observable } from 'rxjs';
import { PlayerStat, PlayerStatRow, Team, TopStatRow } from '../app.models';
import { baseUrl } from '../app.utils';

@Injectable({
  providedIn: 'root',
})
export class PlayerStatService {
  private playerStatsBaseUrl = `${baseUrl}/player_stats`;

  constructor(private http: HttpClient) {}

  getPlayerStats(team1Name: string, team2Name: string, matchDate: string) {
    const params = new HttpParams()
      .set('team_1_name', team1Name)
      .set('team_2_name', team2Name)
      .set('match_date', matchDate);

    return this.http.get<PlayerStat[]>(`${this.playerStatsBaseUrl}/get`, {
      params,
    });
  }

  insertPlayerStat(payload: any): Observable<any> {
    return this.http
      .post<any>(`${this.playerStatsBaseUrl}/insert`, payload)
      .pipe(
        catchError((error) => {
          console.error('Error inserting player stat:', error);
          throw error; // Handle error appropriately here
        }),
      );
  }

  fetchTopStat(
    leagueName: string,
    season: number,
    statName: string,
  ): Observable<{ top_stats: TopStatRow[] }> {
    const params = new HttpParams()
      .set('league_name', leagueName)
      .set('season', season.toString())
      .set('stat_name', statName);

    return this.http.get<any>(`${this.playerStatsBaseUrl}/top_stat`, {
      params,
    });
  }

  fetchPlayerStatsForSeasons(
    player_id: number,
    seasonList: string,
  ): Observable<PlayerStatRow[]> {
    const params = new HttpParams()
      .set('player_id', player_id)
      .set('season', seasonList.toString());

    return this.http.get<PlayerStatRow[]>(
      `${this.playerStatsBaseUrl}/for_seasons`,
      { params },
    );
  }
}
