import { Injectable } from '@angular/core';
import {HttpClient, HttpParams} from '@angular/common/http';
import {Observable} from 'rxjs';
import {Broadcaster} from "../app.models";

@Injectable({
    providedIn: 'root'
})
export class BroadcasterService {

    private apiUrl = 'http://localhost:5001/api/broadcasters';  // API endpoint

    constructor(private http: HttpClient) {
    }

    getAllBroadcasters(): Observable<any> {
        return this.http.get<Broadcaster[]>(`${this.apiUrl}/all`);
    }


}
