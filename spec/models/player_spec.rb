require 'rails_helper'

describe Player, type: :model do

  describe 'relationships', type: :model do
    it {should belong_to :hockey_team}
  end
end