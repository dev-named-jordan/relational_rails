require 'rails_helper'

RSpec.describe "Individual Hockey Teams Pages" do

  it "Has all team attributes" do
    team_1 = HockeyTeam.create(
      name: "Colorado Avalanche",
      city: "Denver",
      rank: 1,
      original_franchise: false,
      stanley_cups: 2
    )

    visit "/hockeyteams/#{team_1.id}"

    expect(page).to have_content(team_1.name)
    expect(page).to have_content(team_1.city)
    expect(page).to have_content(team_1.rank)
    expect(page).to have_content(team_1.original_franchise)
    expect(page).to have_content(team_1.stanley_cups)
    expect(page).to have_content(team_1.created_at)
    expect(page).to have_content(team_1.updated_at)
  end

  it "Has an edit link" do
    team_1 = HockeyTeam.create(
      name: "Colorado Avalanche",
      city: "Denver",
      rank: 1,
      original_franchise: false,
      stanley_cups: 2
    )

    visit "/hockeyteams/#{team_1.id}"

    expect(page).to have_link('Edit Team', href: "/hockeyteams/#{team_1.id}/edit")
  end

  it "Has a delete button" do
    team_1 = HockeyTeam.create(
      name: "Colorado Avalanche",
      city: "Denver",
      rank: 1,
      original_franchise: false,
      stanley_cups: 2
    )

    visit "/hockeyteams/#{team_1.id}"

    expect(page).to have_selector("input[type=submit][value=delete]")
  end
end