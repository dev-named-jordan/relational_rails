RSpec.describe "School Student Page" do
  it "Has Students Listed with their attributes" do

    school_1 = School.create!(name: "Turing",
               days_in_school_year: 256,
             accepts_financial_aid: false)

    student_1 = school_1.students.create!(name: "Tim",
                         school_days_completed: 200,
                           needs_financial_aid: true)


    visit "/students/#{student_1.id}"

    expect(page).to have_content(student_1.name)
    expect(page).to have_content(student_1.needs_financial_aid)
    expect(page).to have_content(student_1.school_id)
    expect(page).to have_content(student_1.school_days_completed)
    expect(page).to have_content(student_1.created_at)
    expect(page).to have_content(student_1.updated_at)
    expect(page).to have_link("Edit Student", href: "/students/#{student_1.id}/edit")
  end
end
