class AddHockeyTeamsToPlayers < ActiveRecord::Migration[5.2]
  def change
    add_reference :players, :hockey_team, foreign_key: true
  end
end
