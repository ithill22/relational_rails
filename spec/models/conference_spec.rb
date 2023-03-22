require 'rails_helper'

RSpec.describe Conference, type: :model do
  describe "relationships" do
    it { should have_many :teams }
  end
end