export interface Stadium {
  name: string;
  city: string;
  zip_code: string;
  capacity: number;
}
export interface League {
  name: string;
  country: string;
}

export interface Team {
  name: string;
  established_year: string;
}

export interface Manager {
  first_name: string;
  last_name: string;
  dob: string;
  nationality: string;
}

export interface insertTeamAndPlayerPayload {
  // leagueSeasonMap: {[key: string]: number}
  leagueName: string;
  seasons: string[];
  team: Team;
  stadium: Stadium;
  players: Player[];
  manager: Manager;
}

export interface PlayerStat {
  player_id: number;
  team_1_name: string;
  team_2_name: string;
  match_date?: string;
  goals_scored: number;
  yellow_card: number;
  red_card: number;
}

export interface Sponsor {
  name: string;
  country: string;
  industry: string;
  website_url: string;
}

export interface SponsorLeague {
  sponsor_name: string;
  league_name: string;
  sponsorship_amount: number;
}

export interface Player {
  player_id: number;
  first_name: string;
  last_name: string;
  dob: string;
  nationality: string;
  market_value: number;
  jersey_number: string;
  position_abb: string;
}

export interface TeamDetails {
  manager_id: number;
  first_name: string;
  last_name: string;
  dob: string;
  nationality: string;
  team_name: string;
  total_team_value: number;
  stadium_name: string;
  league_name: string;
}

export interface Game {
  team_1_name: string;
  team_2_name: string;
  stadium_name: string;
  match_date: string;
  attendance: number;
}

export interface LeagueTableRow {
  team_rank?: number;
  league_name: string;
  team_name: string;
  season: number;
  matches_played: number;
  wins: number;
  losses: number;
  goals_scored: number;
  goals_conceded: number;
  points: number; // Total points (calculated as wins * 3 + draws)
  goal_difference: number;
  draws: number;
}

export interface TopStatRow {
  first_name: string;
  last_name: string;
  player_id: number;
  position_abb: string;
  team_name: string;
  total_stat: number;
}

export interface PlayerStatRow {
  player_id: number;
  season: number;
  total_goals: number;
  total_yellows: number;
  total_reds: number;
  team_name?: string;
  league_name?: string;
}

export interface PredictionResponse {
  prediction: number;
  prediction_label: string;
  probabilities: number[];
}
