require 'rails_helper'

RSpec.describe "Edit player page", type: :feature do

  it "Has all the correct fields and can execute" do
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

    visit "/players/#{player.id}/edit"
    fill_in('player[name]', :with=> 'Jerry Seinfield')
    fill_in('player[age]', :with=> '70')
    fill_in('player[years_played]', :with=> '1')
    fill_in('player[attended_college]', :with=> 'TRUE')
    find("input[type=submit]").click

    expect(href: "/players/#{player.id}") 
  end

  it 'Has a link for the players and hockey teams index page' do

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

    visit "/players/#{player.id}/edit"
    expect(page).to have_link('Players Who Played College', href: '/players')
    expect(page).to have_link('Hockey Teams', href: '/hockeyteams')
  end
end