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
end