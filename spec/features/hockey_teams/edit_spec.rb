require 'rails_helper'

RSpec.describe "Edit Team Page", type: :feature do

  it "Has all the correct input fields and they can execute" do
    team_2 = HockeyTeam.create(
      name: "Arizona Coyotes",
      city: "Glendale",
      rank: 31,
      original_franchise: true,
      stanley_cups: 0
    )

    visit "/hockeyteams/#{team_2.id}/edit"
    fill_in('hockey_team[name]', :with=> 'Colorado Avalanche')
    fill_in('hockey_team[city]', :with=> 'Denver')
    fill_in('hockey_team[rank]', :with=> '1')
    fill_in('hockey_team[original_franchise]', :with=> 'TRUE')
    fill_in('hockey_team[stanley_cups]', :with=> '2')
    find("input[type=submit]").click

    expect(href: "/hockeyteams/#{team_2.id}")
  end
end