import { Injectable } from '@angular/core';
import {HttpClient} from '@angular/common/http';
import {catchError, Observable} from 'rxjs';
import {PlayerStat} from "../app.models";

@Injectable({
  providedIn: 'root'
})
export class PlayerStatService {

  private apiUrl = 'http://localhost:5001/api/player_stats';  // API endpoint

  constructor(private http: HttpClient) { }

  insertPlayerStat(playerStats: PlayerStat[]): Observable<any> {
    // Make the HTTP POST request to the Flask API
    const payload = {
      player_stats: playerStats
    }
    return this.http.post<any>(`${this.apiUrl}/insert`, payload)
      .pipe(
        catchError((error) => {
          console.error('Error inserting player stat:', error);
          throw error; // Handle error appropriately here
        })
      );
  }

}
