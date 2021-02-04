class School < ApplicationRecord
  validates_presence_of :name, :days_in_school_year, :accepts_financial_aid
  
  has_many :student
end
