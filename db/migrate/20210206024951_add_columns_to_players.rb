class AddColumnsToPlayers < ActiveRecord::Migration[5.2]
  def change
    add_column :players, :created_at, :datetime
    add_column :players, :updated_at, :datetime
  end
end
