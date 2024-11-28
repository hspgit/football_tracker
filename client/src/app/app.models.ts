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

export interface PlayerStat {
  player_id: number,
  team_1_name:string,
  team_2_name:string,
  match_date?: string,
  goals_scored: number,
  yellow_card: number,
  red_card: number
}

export interface Player {
  player_id: number,
  first_name: string,
  last_name: string,
  dob: string,
  nationality: string,
  market_value: number,
  jersey_number: string,
  position_abb: string
}

export interface Game {
  team_1_name: string,
  team_2_name: string,
  stadium_name: string,
  match_date: string,
  attendance: number
}

export interface LeagueTableRow {
  league_name: string;
  team_name: string;
  season: number;
  matches_played: number;
  wins: number;
  losses: number;
  goals_scored: number;
  goals_conceded: number;
  points: number;               // Total points (calculated as wins * 3 + draws)
  goal_difference: number;
  draws: number;
}
