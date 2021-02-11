require 'rails_helper'

RSpec.describe 'Players Index Page', type: :feature do

  it 'Can see all players who attended college with attributes' do
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

    visit '/players'

    expect(page).to have_content(player.name)
    expect(page).to have_content(player.age)
    expect(page).to have_content(player.attended_college)
    expect(page).to have_content(player.years_played)
    expect(page).to have_content(player.hockey_team_id)
    expect(page).to have_content(player.created_at)
    expect(page).to have_content(player.updated_at)
  end

  it 'Has links to individual players' do
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

    visit '/players'

    expect(page).to have_link("#{player.name}" ,href: "/players/#{player.id}")
  end

  it 'Has a link to the hockey teams index page' do

    visit '/players'
    expect(page).to have_link('Hockey Teams', href: '/hockeyteams')
  end

  it 'has an edit and delete option for every player' do
    
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
    player2 = team_2.players.create(
      name: 'Jack Moulson',
      age: 30,
      attended_college: true,
      years_played: 10
    )

    visit '/players'
    expect(page).to have_link('Edit Player', href: "/players/#{player.id}/edit")
    expect(page).to have_link('Edit Player', href: "/players/#{player2.id}/edit")
    expect(page).to have_selector('form[action="/players/#{player.id}"], input[type=submit][value=delete]')
    expect(page).to have_selector('form[action="/players/#{player2.id}"], input[type=submit][value=delete]')

  end
end