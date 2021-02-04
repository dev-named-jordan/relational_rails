class CreateSchools < ActiveRecord::Migration[5.2]
  def change
    create_table :schools do |t|
      t.string :name
      t.integer :days_in_school_year
      t.boolean :accepts_financial_aid

      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
    end
  end
end
