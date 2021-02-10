require 'rails_helper'

RSpec.describe "Edit student page", type: :feature do

  it "Has all the correct fields and can execute" do
    school_1 = School.create!(name: "Turing",
               days_in_school_year: 256,
             accepts_financial_aid: false)

    student_1 = school_1.students.create!(name: "Tim",
                         school_days_completed: 200,
                           needs_financial_aid: true)

    visit "/students/#{student_1.id}/edit"

    fill_in('student[name]', :with=> 'Tim')
    fill_in('student[school_days_completed]', :with=> '255')
    check('student[needs_financial_aid]')
    find("input[type=submit]").click

    expect(href: "/students/#{student_1.id}")
  end
end
