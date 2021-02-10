require 'rails_helper'

RSpec.describe 'As a visitor' do
  describe 'When I visit the Student Index page' do
    it 'Add New Student link takes us to "/schools/new"' do

      school_1 = School.create!(name: "Turing",
                 days_in_school_year: 256,
               accepts_financial_aid: false)

      visit "/schools/#{school_1.id}"

      click_link "Create Student"
      fill_in 'student[name]', :with => 'Turing'
      fill_in 'student[school_days_completed]', :with => '249'
      check('student[needs_financial_aid]')
      expect(current_path).to eq("/schools/#{school_1.id}/students/new")
      click_on "Create Student"
      expect(page).to have_content(Student)
      expect(Student.all.count).to eq(1)
    end
  end
end
