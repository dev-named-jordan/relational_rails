class AddColumnToHockeyTeams < ActiveRecord::Migration[5.2]
  def change
    add_column :hockey_teams, :created_at, :datetime, null: false
    add_column :hockey_teams, :updated_at, :datetime, null: false
  end
end
