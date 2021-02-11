require 'rails_helper'

RSpec.describe 'As a visitor' do
  describe 'When I visit the School Index page' do
    it 'Add New School link takes us to "/schools/new"' do

      visit '/schools'
      click_link "Add New School"
      fill_in 'school[name]', :with => 'Turing'
      expect(current_path).to eq("/schools/new")
      click_button "Create New School"
      expect(page).to have_content(School)
    end
    it 'Can add school' do
      school_1 = School.create!(name: "Turing",
                 days_in_school_year: 256,
               accepts_financial_aid: false)

    expect(School.all.count).to eq(1)
    end
  end
end
