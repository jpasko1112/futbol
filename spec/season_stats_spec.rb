require "spec_helper"

RSpec.describe SeasonStats do
  before(:each) do
    @game_path = "./data/games.csv"
    @team_path = "./data/teams.csv"
    @game_teams_path = "./data/game_teams.csv"

    @locations = {
    games: @game_path,
    teams: @team_path,
    game_teams: @game_teams_path
    }

    @season_stats = SeasonStats.new(@locations)
    @season_stats.merge_game_game_teams
    @season_stats.merge_teams_to_game_game_teams
  end

  describe "#initialize" do
    it "exists" do
      expect(@season_stats).to be_a(SeasonStats)
    end
  end

  describe "#num_coach_wins" do 
    it "returns a hash with coach name as key and number of wins over a given season as a value" do 
      expect(@season_stats.num_coach_wins("20132014")).to be_a(Hash)
      expect((@season_stats.num_coach_wins("20132014")).keys[0]).to be_a(String)
    end
  end

  describe "#most_accurate_team" do
    it "returns the team name with best shot:goal" do
      expect(@season_stats.most_accurate_team("20132014")).to eq "Real Salt Lake"
      expect(@season_stats.most_accurate_team("20142015")).to eq "Toronto FC"
    end
  end

  describe "#least_accurate_team" do
    it "returns the team name with the worst shot:goal" do
      expect(@season_stats.least_accurate_team("20132014")).to eq "New York City FC"
      expect(@season_stats.least_accurate_team("20142015")).to eq "Columbus Crew SC"  
    end
  end

  describe "Accuracy helper methods" do
    it "#all_goals_by_team_by_season" do
      expect(@season_stats.all_goals_by_team_by_season("20132014")).to be_a Hash
      expect(@season_stats.all_goals_by_team_by_season("20132014").length).to eq(30)
      expect(@season_stats.all_goals_by_team_by_season("20132014")["1"]).to eq(157)
    end
  
    it "#all_shots_by_team_by_season" do
      expect(@season_stats.all_shots_by_team_by_season("20132014")).to be_a Hash
      expect(@season_stats.all_shots_by_team_by_season("20132014").length).to eq(30)
      expect(@season_stats.all_shots_by_team_by_season("20132014")["1"]).to eq(513)
    end
  
    it "#teams_shot_ratio" do
      expect(@season_stats.teams_shot_ratio("20132014")).to be_a Hash
      expect(@season_stats.teams_shot_ratio("20132014").length).to eq(30) 
      expect(@season_stats.teams_shot_ratio("20132014")["1"]).to eq(0.3060428849902534) 
    end
  
    it "#best_shot_ratio_team_id" do
      expect(@season_stats.best_shot_ratio_team_id("20132014")).to eq("24")
      expect(@season_stats.best_shot_ratio_team_id("20142015")).to eq("20")
    end
    
    it "#worst_shot_ratio_team_id" do
      expect(@season_stats.worst_shot_ratio_team_id("20132014")).to eq("9")
      expect(@season_stats.worst_shot_ratio_team_id("20142015")).to eq("53")
    end
  end
  
  describe "#winningest_coach" do
    it "returns the coach with the best win percentage for the season" do
      expect(@season_stats.winningest_coach("20132014")).to eq("Claude Julien")
      expect(@season_stats.winningest_coach("20142015")).to eq("Alain Vigneault")
    end
  end

  describe "#worst_coach" do
    it "returns the coach with the worst win percentage" do
      expect(@season_stats.worst_coach("20132014")).to eq("Peter Laviolette")
      expect(@season_stats.worst_coach("20142015")).to eq("Craig MacTavish").or(eq("Ted Nolan"))
    end
  end

  describe "#head_coach_games" do
    it "returns the number of games a coach has played" do
      expect(@season_stats.head_coach_games("Claude Julien", "20132014")).to be_a(Integer)
      expect(@season_stats.head_coach_games("Craig MacTavish", "20142015")).to be_a(Integer)
    end
  end

  describe "#num_team_tackles" do 
    it "returns a hash with team name as keys and number of tackles as values" do 
      expect(@season_stats.num_team_tackles("20132014")).to be_a(Hash)
      expect((@season_stats.num_team_tackles("20132014")).keys[0]).to be_an(Integer)
    end
  end

  describe "#most_tackles" do 
    it "Name of the Team with the most tackles in the season" do 
      expect(@season_stats.most_tackles("20132014")).to eq("FC Cincinnati")
      expect(@season_stats.most_tackles("20142015")).to eq("Seattle Sounders FC")
    end
  end

  describe "#fewest_tackles" do 
    it "Name of the Team with the fewest tackles in the season" do 
      expect(@season_stats.fewest_tackles("20132014")).to eq("Atlanta United")
      expect(@season_stats.fewest_tackles("20142015")).to eq("Orlando City SC")
    end
  end
end