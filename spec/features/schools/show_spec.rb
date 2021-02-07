require 'rails_helper'

RSpec.describe "When visiting schools/:id" do
  it "It has a list of schools" do
    school_1 = School.create!(name: "Turing",
                              days_in_school_year: 256,
                              accepts_financial_aid: false)

    visit "/schools/#{school_1.id}"

    expect(page).to have_content(school_1.name)
    expect(page).to have_content(school_1.days_in_school_year)
    expect(page).to have_content(school_1.accepts_financial_aid)
  end
end
