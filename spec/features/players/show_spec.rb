require 'rails_helper'

RSpec.describe 'Individual Players Page', type: :feature do

  it 'has all visibile attributes for the player' do
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

    visit "/players/#{player.id}"

    expect(page).to have_content(player.name)
    expect(page).to have_content(player.age)
    expect(page).to have_content(player.attended_college)
    expect(page).to have_content(player.years_played)
    expect(page).to have_content(player.hockey_team_id)
    expect(page).to have_content(player.created_at)
    expect(page).to have_content(player.updated_at)
  end

  it 'Has a delete button' do
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

    visit "/players/#{player.id}"

    expect(page).to have_selector("input[type=submit][value=delete]")
  end

  it 'Can delete player' do
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

    visit "/players/#{player.id}"

    find("input[type=submit][value=delete]").click

    expect(href: '/players')
    expect(page).to_not have_content(player.name)
  end

  it 'Has an edit player button' do
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

    visit "/players/#{player.id}"

    expect(page).to have_link('Edit Player', href: "/players/#{player.id}/edit")
  end

  it 'has a link to the players and hockey teams index page' do

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

    visit "/players/#{player.id}"
    expect(page).to have_link('Players Who Played College', href: '/players')
    expect(page).to have_link('Hockey Teams', href: '/hockeyteams')
  end
end