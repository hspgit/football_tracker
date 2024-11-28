import { Injectable } from '@angular/core';
import {HttpClient} from '@angular/common/http';
import {catchError, Observable} from 'rxjs';
import {Game} from "../app.models";

@Injectable({
  providedIn: 'root'
})
export class GameService {

  private apiUrl = 'http://localhost:5001/api/games';  // API endpoint

  constructor(private http: HttpClient) { }

  insertGame(game: Game): Observable<any> {
    // Make the HTTP POST request to the Flask API
    return this.http.post<any>(`${this.apiUrl}/insert`, game)
      .pipe(
        catchError((error) => {
          console.error('Error inserting game:', error);
          throw error; // Handle error appropriately here
        })
      );
  }

}
