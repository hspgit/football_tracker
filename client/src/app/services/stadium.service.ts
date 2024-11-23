import { Injectable } from '@angular/core';
import {HttpClient, HttpParams} from '@angular/common/http';
import {Observable} from 'rxjs';
import {Stadium} from "../app.models";

@Injectable({
  providedIn: 'root'
})
export class StadiumService {

  private apiUrl = 'http://localhost:5001/api/stadiums';  // API endpoint

  constructor(private http: HttpClient) {
  }

  getAllStadiums(): Observable<any> {
    return this.http.get<Stadium[]>(`${this.apiUrl}/all`);
  }

  getStadiumsForTeams(team1Name: string, team2Name: string): Observable<any> {
    const teamNamesList = `${team1Name},${team2Name}`; // Create a comma-separated list of team names
    const params = new HttpParams().set('team_names', teamNamesList); // Pass the list as a parameter

    return this.http.get<Stadium[]>(`${this.apiUrl}/byTeams`, { params }); // Call the API endpoint
  }
}
