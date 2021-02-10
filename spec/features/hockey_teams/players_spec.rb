require 'rails_helper'
require 'orderly'

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
  
  it 'Can search for players over a certain age' do

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
    player2 = team_1.players.create(
      name: "Jack Moulson",
      age: 26,
      attended_college: true,
      years_played: 10
    )

    visit "/hockeyteams/#{team_1.id}/players"
    fill_in :search, with: '25'
    click_on("Search")

    expect(page).to have_content(player2.name)
    expect(page).to_not have_content(player.name)
  end

  it 'can sort players alphabetically' do
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
    player2 = team_1.players.create(
      name: "Jack Moulson",
      age: 26,
      attended_college: true,
      years_played: 10
    )

    visit "/hockeyteams/#{team_1.id}/players"
    click_on :sort

    expect(player2.name).to appear_before(player.name)
  end
end