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
end