require 'rails_helper'

RSpec.describe 'As a visitor' do
  describe 'When I visit a School show page' do
    it 'Should have a link to delete the School' do
      school_1 = School.create!(name: "Turing",
                                days_in_school_year: 256,
                                accepts_financial_aid: false)

      visit "/schools/#{school_1.id}"

      expect(page).to have_link("Delete School")
    end

    it 'Gets deleted when clicking the link Delete School' do
      school_1 = School.create!(name: "Turing",
                                days_in_school_year: 256,
                                accepts_financial_aid: false)

      visit "/schools/#{school_1.id}"
      
      click_link "Delete School"
      expect(page).not_to have_content(school_1.name)
      expect(current_path).to eq('/schools')
    end
  end
end
