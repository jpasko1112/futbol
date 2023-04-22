# Psuedocode
# ------------
# this Game Class will only feature game attributes, no methods.
class Game
  attr_accessor :game_id,
                :away_team_id,
                :home_team_id,
                :home_team_goals,
                :away_team_goals,
                :season,
                :home_head_coach,
                :away_head_coach,
                :home_shots,
                :away_shots,
                :home_tackles,
                :away_tackles,
                :home_result,
                :away_result,
                :home_team_name,
                :away_team_name,
                :total_score

  def initialize(details)
    @game_id = details[:game_id]
    @away_team_id = details[:away_team_id]
    @home_team_id = details[:home_team_id]
    @home_team_goals = details[:home_goals].to_i
    @away_team_goals = details[:away_goals].to_i
    @season = details[:season]
    @home_head_coach = details[:home_head_coach]
    @away_head_coach = details[:away_head_coach]
    @home_shots = details[:home_shots].to_i
    @away_shots = details[:away_shots].to_i
    @home_tackles = details[:home_tackles].to_i
    @away_tackles = details[:away_tackles].to_i
    @home_result = details[:home_result]
    @away_result = details[:away_result]
    @home_team_name = details[:home_team_name]
    @away_team_name = details[:away_team_name]
    @total_score = @home_team_goals.to_i + @away_team_goals.to_i
  end
end