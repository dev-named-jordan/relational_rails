class HockeyTeamsController < ApplicationController

  def index
    @hockey_teams = HockeyTeam.all
  end

  def show
    @hockey_team = HockeyTeam.find(params[:id])
  end
end