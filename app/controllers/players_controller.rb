class PlayersController < ApplicationController

  def index
    @players = Player.all
  end

  def show
    @player = Player.find(params[:id])
  end

  def edit
    @player = Player.find(params[:id])
  end

  def update
    player = Player.find(params[:id])
    player.update ({
      name: params[:player][:name],
      age: params[:player][:age],
      attended_college: params[:player][:attended_college],
      years_played: params[:player][:years_played]
    })

    player.save
    redirect_to "/players/#{player.id}"
  end
end