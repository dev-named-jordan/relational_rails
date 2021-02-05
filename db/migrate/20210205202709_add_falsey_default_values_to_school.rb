class AddFalseyDefaultValuesToSchool < ActiveRecord::Migration[5.2]
  def change
    change_column :schools, :accepts_financial_aid, :boolean, :default => false
  end
end
