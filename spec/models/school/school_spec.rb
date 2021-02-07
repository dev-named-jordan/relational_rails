require 'rails_helper'

RSpec.describe School, type: :model do
  describe 'validations' do
      it {should validate_presence_of :name}
    end

  describe 'relationships' do
    it {should have_many :student}
  end

end
