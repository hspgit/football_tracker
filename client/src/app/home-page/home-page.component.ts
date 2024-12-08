import { Component, OnInit } from '@angular/core';
import { LeagueService } from '../services/league.service';
import { forkJoin } from 'rxjs';
import { League, LeagueTableRow, SponsorLeague } from '../app.models';
import { Chart, ChartConfiguration, ChartData, registerables } from 'chart.js';
import { BaseChartDirective } from 'ng2-charts';
import { baseChartConfig, baseTension, delayAnimation } from '../app.utils';
import { SponsorService } from '../services/sponsor.service';

@Component({
  selector: 'app-home-page',
  standalone: true,
  imports: [BaseChartDirective],
  templateUrl: './home-page.component.html',
  styleUrl: './home-page.component.css',
})
export class HomePageComponent implements OnInit {
  leagueNames: string[] = [];
  seasons = [2022, 2023, 2024];

  leagueSponsorDetails: SponsorLeague[][] = [];

  leagueStats: LeagueTableRow[] = []; // Each inner array represents one combination of league and season

  premierLeagueChart!: ChartConfiguration['data'];
  laLigaChart!: ChartConfiguration['data'];
  mlsChart!: ChartConfiguration['data'];
  chartOptions: ChartConfiguration['options'];
  sponsorChartData!: ChartConfiguration['data'];
  sponsorChartOptions: ChartConfiguration['options'];

  constructor(
    private leagueService: LeagueService,
    private sponsorService: SponsorService,
  ) {
    Chart.register(...registerables);
  }

  ngOnInit() {
    this.fetchAllLeagues();
  }

  fetchAllLeagues() {
    this.leagueService.getAllLeagues().subscribe({
      next: (resp: League[]) => {
        this.leagueNames = resp.map((el) => el.name);
        this.fetchLeagueStats();
        this.fetchSponsorDetails();
      },
    });
  }

  fetchSponsorDetails() {
    const requests = this.leagueNames.map(
      (el) => this.sponsorService.getSponsorshipDetailByLeague(el), // Return the observable
    );

    forkJoin(requests).subscribe({
      next: (responses: SponsorLeague[][]) => {
        // Adjust type to match response shape
        this.leagueSponsorDetails = responses;
        console.log(this.leagueSponsorDetails);
        this.setupChartData();
      },
      error: (err) => {
        console.error('Error fetching sponsor details', err);
      },
    });
  }

  setupChartData() {
    const labels = this.leagueSponsorDetails.map(
      (leagueSponsors) => leagueSponsors[0]?.league_name || 'Unknown League',
    ); // League names (fallback to "Unknown League" if no data)

    const sponsorNames = Array.from(
      new Set(
        this.leagueSponsorDetails.flatMap((leagueSponsors) =>
          leagueSponsors.map((sponsor) => sponsor.sponsor_name),
        ),
      ),
    ); // Unique sponsor names

    const datasets = sponsorNames.map((sponsorName, index) => {
      return {
        label: sponsorName,
        data: this.leagueSponsorDetails.map((leagueSponsors) => {
          const sponsor = leagueSponsors.find(
            (s) => s.sponsor_name === sponsorName,
          );
          return sponsor ? sponsor.sponsorship_amount / 1000000 : null; // null if sponsor not present in league
        }),
        backgroundColor: this.getRandomColorForSponsor(index), // Assign random color for each sponsor
      };
    });

    // Set up the chart data and return
    this.sponsorChartData = {
      labels: labels,
      datasets: datasets,
    };
    this.setupSponsorChartConfig();
  }

  setupSponsorChartConfig() {
    // @ts-ignore
    let delayed;
    // @ts-ignore
    this.sponsorChartOptions = {
      animation: delayAnimation,
      scales: {
        x: {
          stacked: true,
        },
        y: {
          ticks: {
            // Include a dollar sign in the ticks
            callback: function (value, index, ticks) {
              return '$' + value + 'M';
            },
          },
          stacked: true,
        },
      },
    };
  }

  // Helper function to generate random colors
  getRandomColorForSponsor(index: number): string {
    const beautifulColors = [
      'rgba(75, 192, 192, 0.7)', // Teal
      'rgba(255, 206, 86, 0.7)', // Yellow
      'rgba(255, 99, 132, 0.7)', // Pinkish Red
      'rgba(153, 102, 255, 0.7)', // Lavender
      'rgba(54, 162, 235, 0.7)', // Light Blue
      'rgba(255, 159, 64, 0.7)', // Orange
      'rgba(201, 203, 207, 0.7)', // Light Gray
      'rgba(255, 99, 71, 0.7)', // Tomato Red
      'rgba(46, 139, 87, 0.7)', // Sea Green
      'rgba(123, 104, 238, 0.7)', // Medium Slate Blue
    ];
    return beautifulColors[index % beautifulColors.length];
  }

  fetchLeagueStats() {
    // Create an array of observables for each leagueName-season combination
    const observables = this.leagueNames.flatMap((leagueName) =>
      this.seasons.map((season) =>
        this.leagueService.getLeagueStats(leagueName, season),
      ),
    );

    // Use forkJoin to execute all observables and wait for results
    forkJoin(observables).subscribe({
      next: (responses: LeagueTableRow[]) => {
        this.leagueStats = responses; // Store the combined results
        this.setHomePageChartData();
        this.setChartConfig();
      },
      error: (err) => {
        console.error('Error fetching league stats:', err);
      },
    });
  }

  setHomePageChartData() {
    const leagueChartData: { [key: string]: any } = {};

    // Group data by league
    this.leagueNames.forEach((leagueName) => {
      const statsForLeague: LeagueTableRow[] = this.leagueStats
        .flat() // Flatten the array to process all entries
        .filter((stat) => stat.league_name === leagueName);

      // Create a map to group stats by team name
      const teamStatsMap = new Map<
        string,
        { season: number; rank: number }[]
      >();

      statsForLeague.forEach((stat) => {
        if (!teamStatsMap.has(stat.team_name)) {
          teamStatsMap.set(stat.team_name, []);
        }
        teamStatsMap
          .get(stat.team_name)!
          .push({ season: stat.season, rank: stat.team_rank || 0 });
      });

      // Extract labels (seasons)
      const seasons = this.seasons;

      // Prepare datasets
      const datasets = Array.from(teamStatsMap.entries()).map(
        ([teamName, teamStats], index) => {
          const data = seasons.map((season) => {
            const statForSeason = teamStats.find(
              (stat) => stat.season === season,
            );
            return statForSeason ? statForSeason.rank : null; // Null for missing data
          });

          return {
            label: teamName,
            data: data,
            tension: baseTension,
            borderColor: this.getRandomColor(index),
            backgroundColor: 'rgba(0, 0, 0, 0)', // Transparent background
            fill: false,
          };
        },
      );

      // Assign chart data for this league
      leagueChartData[leagueName] = {
        labels: seasons,
        datasets: datasets,
      };
    });

    // Assign chart data for each league
    this.premierLeagueChart = leagueChartData['Premier League'] || null;
    this.laLigaChart = leagueChartData['La Liga'] || null;
    this.mlsChart = leagueChartData['Major League Soccer'] || null;
  }

  setChartConfig() {
    // @ts-ignore
    this.chartOptions = baseChartConfig;
    this.chartOptions = {
      ...this.chartOptions,
      scales: {
        y: {
          reverse: true,
        },
      },
    };
  }

  getRandomColor(index: number): string {
    const colors = [
      'rgba(75, 192, 192, 1)',
      'rgba(255, 206, 86, 1)',
      'rgba(255, 99, 132, 1)',
      'rgba(153, 102, 255, 1)',
      'rgba(54, 162, 235, 1)',
      'rgba(255, 159, 64, 1)',
      'rgba(201, 203, 207, 1)',
      'rgba(255, 99, 71, 1)',
      'rgba(46, 139, 87, 1)',
      'rgba(123, 104, 238, 1)',
    ];
    return colors[index % colors.length];
  }
}
