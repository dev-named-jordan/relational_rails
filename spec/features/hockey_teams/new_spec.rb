require 'rails_helper'

RSpec.describe "New Team Page", type: :feature do

  it "Has all necessary input fields for a new team and" do
    visit '/hockeyteams/new'
    fill_in('hockey_team[name]', :with=> 'Colorado Avalanche')
    fill_in('hockey_team[city]', :with=> 'Denver')
    fill_in('hockey_team[rank]', :with=> '1')
    fill_in('hockey_team[original_franchise]', :with=> 'TRUE')
    fill_in('hockey_team[stanley_cups]', :with=> '2')
    find("input[type=submit]").click

    expect(href: "/hockeyteams")
    expect(page).to have_content('Colorado Avalanche')
  end
end