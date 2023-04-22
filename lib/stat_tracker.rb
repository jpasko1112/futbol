require 'spec_helper'

class StatTracker 
  attr_reader :game,
              :league,
              :season

  def initialize(locations)
    @game = (GamesStats.new(locations))
    @league = (LeagueStats.new(locations))
    @season = (SeasonStats.new(locations))
  end
  
  def self.from_csv(locations)
    stat_tracker = StatTracker.new(locations)
    stat_tracker.game.merge_game_game_teams.merge_teams_to_game_game_teams
    stat_tracker.league.merge_game_game_teams.merge_teams_to_game_game_teams
    stat_tracker.season.merge_game_game_teams.merge_teams_to_game_game_teams
    stat_tracker
  end

  # Game Stats

  def highest_total_score
    @game.highest_total_score
  end

  def lowest_total_score
    @game.lowest_total_score
  end

  def percentage_home_wins
    @game.percentage_home_wins
  end

  def percentage_visitor_wins
    @game.percentage_visitor_wins
  end

  def percentage_ties
    @game.percentage_ties
  end

  def count_of_games_by_season
    @game.count_of_games_by_season
  end

  def average_goals_per_game
    @game.average_goals_per_game
  end

  def average_goals_by_season
    @game.average_goals_by_season
  end

  # League Stats
  
  def count_of_teams
    @league.count_of_teams
  end

  def best_offense
    @league.best_offense
  end

  def worst_offense
    @league.worst_offense
  end

  def highest_scoring_visitor
    @league.highest_scoring_visitor
  end

  def highest_scoring_home_team
    @league.highest_scoring_home_team
  end

  def lowest_scoring_visitor
    @league.lowest_scoring_visitor
  end

  def lowest_scoring_home_team
    @league.lowest_scoring_home_team
  end

  # Season Stats

  def winningest_coach(season)
    @season.winningest_coach(season)
  end

  def worst_coach(season)
    @season.worst_coach(season)
  end
  
  def most_accurate_team(season)
    @season.most_accurate_team(season)
  end

  def least_accurate_team(season)
    @season.least_accurate_team(season)
  end

  def most_tackles(season)
    @season.most_tackles(season)
  end

  def fewest_tackles(season)
    @season.fewest_tackles(season)
  end
end