require 'rails_helper'

RSpec.describe 'As a visitor' do
  describe 'When I visit a School show page' do
    it 'Shows a link to update the School' do
      school_1 = School.create!(name: "Turing",
                                days_in_school_year: 256,
                                accepts_financial_aid: false)

      visit "/schools/#{school_1.id}"

      expect(page).to have_link('Update School')
    end

    it 'When I click link to Update School' do
      school_1 = School.create!(name: "Turing",
                                days_in_school_year: 256,
                                accepts_financial_aid: false)

      visit "/schools/#{school_1.id}"

      click_link "Update School"
      expect(current_path).to eq("/schools/#{school_1.id}/edit")
    end

    it 'When I fill out the form and submit, School is updated' do
      school_1 = School.create!(name: "Turing",
                                days_in_school_year: 256,
                                accepts_financial_aid: false)

      visit "/schools/#{school_1.id}"

      expect(page).to have_link("Update School")
      click_link "Update School"

      expect(current_path).to eq("/schools/#{school_1.id}/edit")
    end
  end
end
