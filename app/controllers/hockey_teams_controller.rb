class HockeyTeamsController < ApplicationController

  def index
    @hockey_teams = HockeyTeam.all
  end

  def show
    @hockey_team = HockeyTeam.find(params[:id])
  end

  def new
  end

  def create
    hockey_team = HockeyTeam.new({
      name: params[:hockey_team][:name],
      city: params[:hockey_team][:city],
      rank: params[:hockey_team][:rank],
      original_franchise: params[:hockey_team][:original_franchise],
      stanley_cups: params[:hockey_team][:stanley_cups]
    })
    hockey_team.save
    redirect_to '/hockeyteams'
  end

  def edit
    @hockey_team = HockeyTeam.find(params[:id])
  end

  def update
    hockey_team = HockeyTeam.find(params[:id])
    hockey_team.update ({
      name: params[:hockey_team][:name],
      city: params[:hockey_team][:city],
      rank: params[:hockey_team][:rank],
      original_franchise: params[:hockey_team][:original_franchise],
      stanley_cups: params[:hockey_team][:stanley_cups]
    })
    hockey_team.save
    redirect_to "/hockeyteams/#{hockey_team.id}"
  end

  def destroy
    HockeyTeam.destroy(params[:id])
    redirect_to '/hockeyteams'
  end

  def players
    @hockey_team = HockeyTeam.find(params[:id])
    @players = @hockey_team.players
    @team_id = params[:id].to_i
  end

  def new_player
    @team = HockeyTeam.all.find{|hockey_team| hockey_team.id == params[:id].to_i}
  end

  def create_player
    hockey_team = HockeyTeam.find(params[:team_id])
    player = hockey_team.players.new({
      name: params[:player][:name],
      age: params[:player][:age],
      attended_college: params[:player][:attended_college],
      years_played: params[:player][:years_played],
    })
    player.save
    redirect_to "/hockeyteams/#{hockey_team.id}/players"
  end
end