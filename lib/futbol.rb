require "csv"

class Futbol
  attr_accessor :games
          
  attr_reader :teams,
              :game_teams
  
  def initialize(locations)
    @games = (CSV.open locations[:games], headers: true, header_converters: :symbol).map { |line| Game.new(line) } 
    @teams = (CSV.open locations[:teams], headers: true, header_converters: :symbol).map { |team| Team.new(team) } 
    @game_teams = (CSV.open locations[:game_teams], headers: true, header_converters: :symbol).map { |game_team| GameTeam.new(game_team) } 
  end

  def merge_game_game_teams
    @games.map! do |game|
      @game_teams.each do |game_team|
        if game_team.game_id == game.game_id 
          if game_team.home_away == "home"
            game.home_team_goals = game_team.goals
            game.home_result = game_team.result
            game.home_shots = game_team.shots
            game.home_head_coach = game_team.head_coach
            game.home_tackles = game_team.tackles
          elsif game_team.home_away == "away"
            game.away_team_goals = game_team.goals
            game.away_result = game_team.result
            game.away_shots = game_team.shots
            game.away_head_coach = game_team.head_coach
            game.away_tackles = game_team.tackles
          end
        end
      end
      game
    end
  end

  def merge_teams_to_game_game_teams
    @games.map! do |game|
      @teams.each do |team|
        if team.team_id == game.home_team_id
          game.home_team_name = team.teamname
        elsif team.team_id == game.away_team_id
          game.away_team_name = team.teamname
        end
      end
      game
    end
  end

  def check_no_extraneous
    num_games = @games.map(&:game_id).uniq.length
    num_game_teams = @game_teams.map(&:game_id).uniq.length
    num_games == num_game_teams
  end

  def check_no_bad_teams
    num_teams = @teams.map(&:team_id).uniq.length
    num_game = @games.map(&:away_team_id).uniq.length
    num_game_teams = @game_teams.map(&:team_id).uniq.length
    (num_game == num_teams) && (num_game_teams == num_teams)
  end
end


