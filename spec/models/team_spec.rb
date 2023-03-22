require 'rails_helper'

RSpec.describe Team, type: :model do
  describe "relationships" do
    it { should belong_to :conference }
  end
end