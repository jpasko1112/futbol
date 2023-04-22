require "spec_helper"

RSpec.describe Game do
  before(:each) do
    @game1 = Game.new(
      game_id: "5", 
      home_team_id: "1", 
      away_team_id: "2", 
      home_goals: "3",
      away_goals: "2",
      season: "5",
      home_head_coach: "Kim B",
      away_head_coach: "K.D.",
      home_shots: "2",
      away_shots: "3",
      home_tackles: "2",
      away_tackles: "4",
      home_result: "WIN",
      away_result: "LOSS",
      home_team_name: "Enums",
      away_team_name: "Codey Bits"
      )
  end

  describe "#initialize" do
    it "can initialize with attributes" do
      expect(@game1).to be_a(Game)
      expect(@game1.game_id).to eq("5")
      expect(@game1.away_team_id).to eq("2")
      expect(@game1.home_team_id).to eq("1")
      expect(@game1.home_team_goals).to eq(3)
      expect(@game1.away_team_goals).to eq(2)
      expect(@game1.season).to eq("5")
      expect(@game1.home_head_coach).to eq("Kim B")
      expect(@game1.away_head_coach).to eq("K.D.")
      expect(@game1.away_head_coach).to eq("K.D.")
      expect(@game1.home_shots).to eq(2)
      expect(@game1.away_shots).to eq(3)
      expect(@game1.home_tackles).to eq(2)
      expect(@game1.away_tackles).to eq(4)
      expect(@game1.home_result).to eq("WIN")
      expect(@game1.away_result).to eq("LOSS")
      expect(@game1.home_team_name).to eq("Enums")
      expect(@game1.away_team_name).to eq("Codey Bits")
    end
  end
end
