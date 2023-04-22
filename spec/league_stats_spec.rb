require 'spec_helper'

RSpec.describe LeagueStats do
  before(:each) do
    @game_path = './data/games.csv'
    @team_path = './data/teams.csv'
    @game_teams_path = './data/game_teams.csv'
    @locations = {
      games: @game_path,
      teams: @team_path,
      game_teams: @game_teams_path
      }
    
      @league_stats = LeagueStats.new(@locations)
      @league_stats.merge_game_game_teams
      @league_stats.merge_teams_to_game_game_teams
  end
  # league_stats tests below are basic tests that are also
  # tested in stat_tracker
  describe '#initialize' do
    it 'exists' do
      expect(@league_stats).to be_a(LeagueStats)
    end
  end

  describe '#count_of_teams' do
    it 'counts teams and returns an integer' do
      expect(@league_stats.count_of_teams).to eq(32)
    end
  end
  
  describe '#offenses' do
    it 'returns a string of the best offense' do
      expect(@league_stats.best_offense).to eq("Reign FC")
    end
    
    it 'returns a string of the worst offense' do
      expect(@league_stats.worst_offense).to eq("Utah Royals FC") 
    end
  end

  describe '#scores' do
    it 'returns string of highest scoring visitor' do
      expect(@league_stats.highest_scoring_visitor).to eq("FC Dallas")
    end
  
    it 'returns string of highest scoring home team' do
      expect(@league_stats.highest_scoring_home_team).to eq("Reign FC")
    end

    it 'returns string of lowest scoring visitor' do
      expect(@league_stats.lowest_scoring_visitor).to eq("San Jose Earthquakes")
    end

    it 'returns string of lowest scoring home team' do 
      expect(@league_stats.lowest_scoring_home_team).to eq("Utah Royals FC")
    end
  end

  # we will add additional tests as needed to ensure helper
  # methods are functioning correctly
  describe '#helper methods' do
    it 'average number of goals method' do
      expect(@league_stats.average_number_of_goals("3")).to be_a(Float)
    end

    it 'average number of goals home method' do
      expect(@league_stats.average_number_of_goals("3")).to be_a(Float)
    end
    
    it 'average number of goals visitor method' do
      expect(@league_stats.average_number_of_goals("3")).to be_a(Float)
    end
    
    it 'total goals by team' do
      expect(@league_stats.total_goals_by_team("3")).to eq(1129)
    end

    it 'total games by team' do
      expect(@league_stats.total_games_by_team("3")).to eq(531)
    end

    it 'team id into name method' do
      expect(@league_stats.team_id_into_name("3")).to eq("Houston Dynamo")
    end

    it 'filter by team id' do
      expect(@league_stats.filter_by_team_id("3")).to be_an(Array)
    end
  end

end

