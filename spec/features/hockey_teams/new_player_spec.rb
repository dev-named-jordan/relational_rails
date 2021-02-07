require 'rails_helper'

RSpec.describe "New Player Page", type: :feature do

  it "has all the correct fields and can execute" do

    team_1 = HockeyTeam.create(
      name: "Colorado Avalanche",
      city: "Denver",
      rank: 1,
      original_franchise: false,
      stanley_cups: 2
    )
    player = team_1.players.create(
      name: "Trevor Suter",
      age: 24,
      attended_college: false,
      years_played: 2
    )

    visit "/hockeyteams/#{team_1.id}/players/new"
    fill_in('player[name]', :with=> 'Jerry Seinfield')
    fill_in('player[age]', :with=> '70')
    fill_in('player[years_played]', :with=> '1')
    fill_in('player[attended_college]', :with=> 'TRUE')
    find("input[type=submit]").click

    expect("/players/#{team_1.id}/players")
  end
end