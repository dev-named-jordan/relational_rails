class School < ApplicationRecord
  validates_presence_of :name, :days_in_school_year
  validates_inclusion_of :accepts_financial_aid, :in => [true, false]

  has_many :students
end
