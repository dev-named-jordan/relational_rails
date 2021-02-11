require 'rails_helper'

RSpec.describe "School Student Page" do
  it "Has Students Listed with their attributes" do

    school_1 = School.create!(name: "Turing",
               days_in_school_year: 256,
             accepts_financial_aid: false)

    student_1 = school_1.students.create!(name: "Tim",
                        school_days_completed: 200,
                          needs_financial_aid: true)


    visit "/schools/#{school_1.id}/students"

    expect(page).to have_content(student_1.name)
    expect(page).to have_content(student_1.needs_financial_aid)
    expect(page).to have_content(student_1.school_id)
    expect(page).to have_content(student_1.school_days_completed)
    expect(page).to have_content(student_1.created_at)
    expect(page).to have_content(student_1.updated_at)
  end
  it "Has Students Listed with their attributes sorted" do

    school_1 = School.create!(name: "Turing",
               days_in_school_year: 256,
             accepts_financial_aid: false)

    student_1 = school_1.students.create!(name: "Tom",
                         school_days_completed: 200,
                           needs_financial_aid: true)

    student_2 = school_1.students.create!(name: "Alice",
                         school_days_completed: 202,
                           needs_financial_aid: true)

    student_3 = school_1.students.create!(name: "Bob",
                         school_days_completed: 240,
                           needs_financial_aid: true)

    visit "/schools/#{school_1.id}/students"
    
    click_link("Sort Names of Students Alphabetically")
    expect(student_2.name).to appear_before(student_3.name)
    expect(student_3.name).to appear_before(student_1.name)
    expect(student_2.name).to appear_before(student_1.name)
  end
end
