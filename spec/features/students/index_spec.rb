require 'rails_helper'

RSpec.describe 'As a visitor' do
  describe 'When I vist "/students"' do
    it 'Should list every student and its attributes' do
      school_1 = School.create!(name: "Turing",
                                days_in_school_year: 256,
                                accepts_financial_aid: false)
      student_1 = school_1.students.create!(name: "Tim", school_days_completed: 200, needs_financial_aid: true)
      student_2 = school_1.students.create!(name: "Jim", school_days_completed: 243, needs_financial_aid: true)

      visit '/students'

      expect(page).to have_content(student_1.name)
      expect(page).to have_content(student_1.school_days_completed)
      expect(page).to have_content(student_1.needs_financial_aid)
      expect(page).to have_content(student_2.name)
      expect(page).to have_content(student_2.school_days_completed)
      expect(page).to have_content(student_2.needs_financial_aid)
      expect(page).to have_link("#{student_1.name}", href: "/students/#{student_1.id}")
      expect(page).to have_link("#{student_2.name}", href: "/students/#{student_2.id}")
    end
  end
end

# RSpec.describe 'As a visitor' do
#   describe 'When I visit "/students"' do
#     it 'I see every student' do
#       # require "pry"; binding.pry
#       school_1 = School.create!(name: "Turing",
#                                 days_in_school_year: 256,
#                                 accepts_financial_aid: false)
#
#       student_1 = Student.create!(name: "UCCS",
#                                 needs_financial_aid: true,
#                                 school_days_completed: 243)
#
#       visit "/students"
#
#       expect(page).to have_content(student_1.name)
#       # expect(page).to have_content(school_2.name)
#       # expect(page).to have_content(school_3.name)
#     end
#   end
# end
