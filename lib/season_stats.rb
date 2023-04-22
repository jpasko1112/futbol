require_relative 'futbol'

class SeasonStats < Futbol

  def initialize(locations)
    super(locations)
  end

  def num_coach_wins(season)
    num_coach_wins = Hash.new
    @games.map do |game|
      if game.season == season
          num_coach_wins[game.home_head_coach] = 0
          num_coach_wins[game.away_head_coach] = 0
      end
    end

  def winningest_coach(season)
    num_coach_wins = Hash.new(0)
    @games.map do |game|
      if game.home_result == "WIN" && game.season == season
        num_coach_wins[game.home_head_coach] += 1
      elsif
        game.away_result == "WIN" && game.season == season
        num_coach_wins[game.away_head_coach] += 1
      end
    end
    num_coach_wins
  end

  def winningest_coach(season)
    coach_wins = num_coach_wins(season)
    coach_wins.each_pair do |coach, wins|
      coach_wins[coach] = (wins.to_f / head_coach_games(coach, season))
    end
    coach_wins.max_by do |coach, percent|
      percent
    end.first
  end
  
  def worst_coach(season)
    coach_wins = num_coach_wins(season)
    coach_wins.each_pair do |coach, wins|
      coach_wins[coach] = (wins.to_f / head_coach_games(coach, season))
    end
    coach_wins.min_by do |coach, percent|
      percent
    end.first
  end

  def head_coach_games(coach, season)
    games.count do |game|
      game.season == season && (game.home_head_coach == coach || game.away_head_coach == coach)
    end
  end

  def num_team_tackles(season)
    num_team_tackles = Hash.new(0)
    @games.map do |game|
      if game.season == season
        num_team_tackles[game.home_team_name] += game.home_tackles 
        num_team_tackles[game.away_team_name] += game.away_tackles
      end
    end
    num_team_tackles
  end

  def most_tackles(season)
    num_team_tackles(season).max_by do |name, tackles|
      tackles
    end.first
  end

  def fewest_tackles(season)
    num_team_tackles(season).min_by do |name, tackles|
      tackles
    end.first
  end
end