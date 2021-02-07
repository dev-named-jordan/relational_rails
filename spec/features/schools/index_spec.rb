require 'rails_helper'

RSpec.describe 'As a visitor' do
  describe 'When I visit "/schools"' do
    it 'I see every school' do
      # require "pry"; binding.pry
      school_1 = School.create!(name: "Turing",
                                days_in_school_year: 256,
                                accepts_financial_aid: false)
      # 
      # school_2 = School.create!(name: "UCCS",
      #                           days_in_school_year: 320,
      #                           accepts_financial_aid: true)
      #
      # school_3 = School.create!(name: "PPCC",
      #                           days_in_school_year: 315,
      #                           accepts_financial_aid: true)

      visit '/schools'

      expect(page).to have_content(school_1.name)
      # expect(page).to have_content(school_2.name)
      # expect(page).to have_content(school_3.name)
    end

  end
end
