import { Injectable } from '@angular/core';
import { baseUrl } from '../app.utils';
import { HttpClient, HttpParams } from '@angular/common/http';
import { Sponsor, SponsorLeague } from '../app.models';

@Injectable({
  providedIn: 'root',
})
export class SponsorService {
  private sponsorsBaseUrl = `${baseUrl}/sponsors`;

  constructor(private http: HttpClient) {}

  getAllSponsors(leagueName: string) {
    const params = new HttpParams().set('league_name', leagueName);

    return this.http.get<Sponsor[]>(`${this.sponsorsBaseUrl}/all`, { params });
  }

  deleteSponsor(sponsorName: string) {
    const params = new HttpParams().set('sponsor_name', sponsorName);

    return this.http.delete<Sponsor[]>(`${this.sponsorsBaseUrl}/delete`, {
      params,
    });
  }

  fetchSponsorDetails(sponsorName: string) {
    const params = new HttpParams().set('sponsor_name', sponsorName);

    return this.http.get<SponsorLeague[]>(`${this.sponsorsBaseUrl}/detail`, {
      params,
    });
  }

  updateSponsorLeagueDetails(payload: SponsorLeague[]) {
    return this.http.post(`${this.sponsorsBaseUrl}/update`, payload);
  }

  createSponsor(payload: Sponsor) {
    return this.http.post(`${this.sponsorsBaseUrl}/create`, payload);
  }

  getSponsorshipDetailByLeague(leagueName: string) {
    const params = new HttpParams().set('league_name', leagueName);

    return this.http.get<SponsorLeague[]>(
      `${this.sponsorsBaseUrl}/detailByLeague`,
      { params },
    );
  }
}
