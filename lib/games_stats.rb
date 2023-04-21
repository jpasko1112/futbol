require_relative "futbol"
class GamesStats < Futbol
  attr_reader 

  def initialize(locations)
    super(locations)
  end

  # highest sum of winning and losing teams score
  def highest_total_score
    # i want to find the game with the highest points scored and add the home score and away score.
    games.map do |game|
      game.away_team_goals + game.home_team_goals
      # require 'pry'; binding.pry
    end.sort.last
  end
end