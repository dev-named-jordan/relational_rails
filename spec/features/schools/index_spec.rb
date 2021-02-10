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

    it "Has Links to School Pages, in order of which they were created" do
      school_1 = School.create!(name: "Turing",
                                days_in_school_year: 256,
                                accepts_financial_aid: false)

      school_2 = School.create!(name: "UCCS",
                                days_in_school_year: 300,
                                accepts_financial_aid: true)


      visit '/schools'

      expect(page).to have_link("#{school_1.name}", href: "/schools/#{school_1.id}")
      expect(page).to have_link("#{school_2.name}", href: "/schools/#{school_2.id}")
      # expect("name: Turing").to appear_before("name: UCCS")
    end

    it "Has a link for a new school" do

      visit '/schools'

      expect(page).to have_link("Add New School", href: "/schools/new")
    end
  end
end
