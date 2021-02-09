require 'rails_helper'

RSpec.describe School, type: :model do
  describe 'validations' do
    it {should validate_presence_of :name}
    it {should validate_presence_of :days_in_school_year}
  end

  describe 'relationships' do
    it {should have_many :students}
  end
end

# RSpec::Matchers.define :accepts_financial_aid do
#   match do |actual|
#     expect(actual).to be_in([true, false])
#   end
# end
