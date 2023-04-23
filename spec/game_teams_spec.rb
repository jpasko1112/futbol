require "spec_helper"

RSpec.describe GameTeam do 
  before(:each) do 
    @gameteam = GameTeam.new(
      game_id: "20", 
      team_id: "3", 
      hoa: "home", 
      head_coach: "Kim Bergstrom", 
      goals: "5", 
      shots: "4", 
      tackles: "3", 
      result: "w")
  end

  describe "#initialize" do 
    it "exists" do 
      expect(@gameteam).to be_a(GameTeam)
      expect(@gameteam.game_id).to eq("20")
      expect(@gameteam.team_id).to eq("3")
      expect(@gameteam.home_away).to eq("home")
      expect(@gameteam.head_coach).to eq("Kim Bergstrom")
      expect(@gameteam.goals).to eq(5)
      expect(@gameteam.shots).to eq(4)
      expect(@gameteam.tackles).to eq(3)
      expect(@gameteam.result).to eq("w")
    end
  end
end