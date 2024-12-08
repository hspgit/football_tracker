import { Injectable } from '@angular/core';
import { HttpClient, HttpParams } from '@angular/common/http';
import { catchError, Observable } from 'rxjs';
import { Game, Team } from '../app.models';
import { baseUrl } from '../app.utils';

@Injectable({
  providedIn: 'root',
})
export class GameService {
  private gamesBaseUrl = `${baseUrl}/games`;

  constructor(private http: HttpClient) {}

  insertGame(game: Game): Observable<any> {
    // Make the HTTP POST request to the Flask API
    return this.http.post<any>(`${this.gamesBaseUrl}/insert`, game).pipe(
      catchError((error) => {
        throw error; // Handle error appropriately here
      }),
    );
  }

  getGames(team1: string, team2: string, season: number) {
    const params = new HttpParams()
      .set('team_1_name', team1)
      .set('team_2_name', team2)
      .set('season', season);

    // Make the HTTP GET request to the Flask API
    return this.http.get<Game[]>(`${this.gamesBaseUrl}/team-games`, { params });
  }
}
