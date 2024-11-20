import { Injectable } from '@angular/core';
import {HttpClient, HttpParams} from '@angular/common/http';
import {Observable} from 'rxjs';
import {Stadium} from "../app.models";

@Injectable({
  providedIn: 'root'
})
export class LeagueService {

  private apiUrl = 'http://localhost:5001/api/stadium';  // API endpoint

  constructor(private http: HttpClient) {
  }

  getAllLeagues(): Observable<any> {
    return this.http.get<Stadium[]>(`${this.apiUrl}/all`);
  }
}
