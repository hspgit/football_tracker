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

export interface Broadcaster {
  channel_name: string;
  streaming_link: string;
}

export interface PlayerStat {
  player_id: number,
  team_1_name:string,
  team_2_name:string,
  match_date: string,
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
