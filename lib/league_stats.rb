require_relative "futbol"

class LeagueStats < Futbol

  def initialize(locations)
    super(locations)
  end

  def count_of_teams
    @games.map(&:away_team_id).uniq.length
  end

  def best_offense
    best_offense = Hash.new(0)
    @games.each do |game|
      best_offense[game.away_team_name] = average_number_of_goals(game.away_team_id)
      best_offense[game.home_team_name] = average_number_of_goals(game.home_team_id)
    end
    sorted = best_offense.max_by{|team, avg_goals| avg_goals}
    sorted[0]
  end

  def worst_offense
    worst_offense = Hash.new(0)
    @games.each do |game|
      worst_offense[game.away_team_name] = average_number_of_goals(game.away_team_id)
      worst_offense[game.home_team_name] = average_number_of_goals(game.home_team_id)
    end
    sorted = worst_offense.min_by{|team, avg_goals| avg_goals}
    sorted[0]
  end


  def highest_scoring_visitor
    best_offense = Hash.new(0)
    @games.each do |game|
      best_offense[game.away_team_name] = average_number_of_goals_visitor(game.away_team_id)
    end
    sorted = best_offense.max_by{|team, avg_goals| avg_goals}
    sorted[0]
  end

  def highest_scoring_home_team
    best_offense = Hash.new(0)
    @games.each do |game|
      best_offense[game.home_team_name] = average_number_of_goals_home(game.home_team_id)
    end
    sorted = best_offense.max_by{|team, avg_goals| avg_goals}
    sorted[0]
  end

  def lowest_scoring_visitor
    worst_offense = Hash.new(0)
    @games.each do |game|
      worst_offense[game.away_team_name] = average_number_of_goals_visitor(game.away_team_id)
    end
    sorted = worst_offense.min_by{|team, avg_goals| avg_goals}
    sorted[0]
  end

  def lowest_scoring_home_team
    worst_offense = Hash.new(0)
    @games.each do |game|
      worst_offense[game.home_team_name] = average_number_of_goals_home(game.home_team_id)
    end
    sorted = worst_offense.min_by{|team, avg_goals| avg_goals}
    sorted[0]
  end

  #Helper Methods
  def average_number_of_goals(team_id)
    total_goals = 0
    @games.each do |game|
      if game.away_team_id == team_id
        total_goals += game.away_team_goals
      elsif game.home_team_id == team_id
        total_goals += game.home_team_goals
      end
    end
    total_goals.fdiv(total_games_by_team(team_id))
  end

  def average_number_of_goals_home(team_id)
    total_goals = 0
    @games.each do |game|
      if game.home_team_id == team_id
        total_goals += game.home_team_goals
      end
    end
    total_goals.fdiv(total_games_by_team(team_id))
  end

  def average_number_of_goals_visitor(team_id)
    total_goals = 0
    @games.each do |game|
      if game.away_team_id == team_id
        total_goals += game.away_team_goals
      end
    end
    total_goals.fdiv(total_games_by_team(team_id))
  end

  def total_goals_by_team(team_id)
    total_goals = 0
    @games.each do |game|
      if game.away_team_id == team_id
      total_goals += game.away_team_goals
      elsif game.home_team_id == team_id
      total_goals += game.home_team_goals
      end
    end
    total_goals
  end
  
  def total_games_by_team(team_id)
    total_games = 0
    @games.each do |game|
      if game.away_team_id == team_id
      total_games += 1 
      elsif game.home_team_id == team_id
      total_games += 1
      end
    end
    total_games
  end

  def team_id_into_name(team_id)
    name_of_team = " "
    @games.each do |game|
      if game.away_team_id == team_id
      name_of_team = game.away_team_name
      elsif game.home_team_id == team_id
      name_of_team = game.home_team_name
      end
    end
    name_of_team
  end

  def filter_by_team_id(team_id)
    @games.map do |game|
      if game.away_team_id == team_id || game.home_team_id == team_id
        game
      end
    end 
  end
end