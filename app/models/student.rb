class Student < ApplicationRecord
  validates_presence_of :name, :school_days_completed, :school_id
  validates_inclusion_of :needs_financial_aid, :in => [true, false]

  belongs_to :school
end
