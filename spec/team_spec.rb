require "spec_helper"

RSpec.describe Team do
  before(:each) do
    @team1 = Team.new({team_id: "5", teamname: "The WallFlowers"})
  end

  it "exists" do
    expect(@team1).to be_a(Team)
  end

  it "has attributes" do
    expect(@team1.team_id).to eq("5")
    expect(@team1.teamname).to eq("The WallFlowers")
  end
end