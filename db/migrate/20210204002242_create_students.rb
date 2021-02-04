class CreateStudents < ActiveRecord::Migration[5.2]
  def change
    create_table :students do |t|
      t.string :name
      t.boolean :needs_financial_aid
      t.references :school, foreign_key: true
      t.integer :school_days_completed

      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
    end
  end
end
