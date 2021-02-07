require 'rails_helper'

RSpec.describe "Team Players Page", type: :feature do

  it "Has Players Listed with their attributes" do

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

    visit "/hockeyteams/#{team_1.id}/players"

    expect(page).to have_content(player.name)
    expect(page).to have_content(player.age)
    expect(page).to have_content(player.attended_college)
    expect(page).to have_content(player.years_played)
    expect(page).to have_content(player.hockey_team_id)
    expect(page).to have_content(player.created_at)
    expect(page).to have_content(player.updated_at)
  end
end