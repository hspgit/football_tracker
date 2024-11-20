import { Injectable } from '@angular/core';
import { HttpClient, HttpParams } from '@angular/common/http';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class TeamService {

  private apiUrl = 'http://localhost:5001/api/teams/players';  // API endpoint

  constructor(private http: HttpClient) { }

  // Method to get players based on team name and season
  getTeamPlayers(teamName: string, season: number): Observable<any> {
    // Prepare the query parameters
    const params = new HttpParams()
      .set('team_name', teamName)
      .set('season', season.toString());

    // Make the HTTP GET request to the Flask API
    return this.http.get<any>(this.apiUrl, { params });
  }

}
