require 'rails_helper'

RSpec.describe "Hockey Teams Index Page", type: :feature do
  it "can see all team names" do
    team_1 = HockeyTeam.create(
      name: "Colorado Avalanche",
      city: "Denver",
      rank: 1,
      original_franchise: false,
      stanley_cups: 2
    )
    team_2 = HockeyTeam.create(
      name: "Arizona Coyotes",
      city: "Glendale",
      rank: 31,
      original_franchise: true,
      stanley_cups: 0
    )

    visit "/hockeyteams"

    expect(page).to have_content(team_1.name)
    expect(page).to have_content(team_2.name)
  end

  it "Has Links to Team Pages" do
    team_1 = HockeyTeam.create(
      name: "Colorado Avalanche",
      city: "Denver",
      rank: 1,
      original_franchise: false,
      stanley_cups: 2
    )
    team_2 = HockeyTeam.create(
      name: "Arizona Coyotes",
      city: "Glendale",
      rank: 31,
      original_franchise: true,
      stanley_cups: 0
    )

    visit '/hockeyteams'

    expect(page).to have_link("#{team_1.name}", href: "/hockeyteams/#{team_1.id}")
    expect(page).to have_link("#{team_2.name}", href: "/hockeyteams/#{team_2.id}")
  end

  it "Has a link for a new team" do

    visit '/hockeyteams'

    expect(page).to have_link("New Team", href: "/hockeyteams/new")
  end

  it 'has a link for the players index page' do

    visit '/hockeyteams'
    expect(page).to have_link('Players Who Played College', href: '/players')
  end


  it 'has an edit and delete button for each team' do
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
      attended_college: true,
      years_played: 2
    )
    team_2 = HockeyTeam.create(
      name: "Arizona Coyotes",
      city: "Glendale",
      rank: 31,
      original_franchise: true,
      stanley_cups: 0
    )

    visit '/hockeyteams'
    expect(page).to have_link('Edit Team', href: "/hockeyteams/#{team_1.id}/edit")
    expect(page).to have_link('Edit Team', href: "/hockeyteams/#{team_2.id}/edit")
    expect(page).to have_selector('form[action="/hockeyteams/#{team_1.id}"], input[type=submit][value=delete]')
    expect(page).to have_selector('form[action="/hockeyteams/#{team_2.id}"], input[type=submit][value=delete]')
  end
end