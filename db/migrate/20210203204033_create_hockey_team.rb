class CreateHockeyTeam < ActiveRecord::Migration[5.2]
  def change
    create_table :hockey_teams do |t|
      t.string :name
      t.string :city
      t.integer :rank
      t.boolean :original_franchise
      t.integer :stanley_cups
    end
  end
end
