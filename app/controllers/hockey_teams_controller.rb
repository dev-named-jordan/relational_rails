class HockeyTeamsController < ApplicationController

  def index
    @hockey_teams = HockeyTeam.all
  end
end