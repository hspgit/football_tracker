import { Injectable } from '@angular/core';
import {HttpClient, HttpParams} from '@angular/common/http';
import {Observable} from 'rxjs';
import {Player} from '../app.models';
import {baseUrl} from '../app.utils';

@Injectable({
  providedIn: 'root'
})
export class PlayerService {

  private playersBaseUrl = `${baseUrl}/players`

  constructor(private http: HttpClient) {
  }

  getPlayers(playerSearchStr: string): Observable<Player[]> {
    const params = new HttpParams()
      .set('player_name', playerSearchStr)
    // Make the HTTP GET request to the Flask API
    return this.http.get<Player[]>(`${this.playersBaseUrl}/all`, {params});
  }
}
