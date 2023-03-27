require 'rails_helper'

RSpec.describe Team, type: :model do
  let!(:pac_12) { Conference.create!(name: "Pac-12", 
    region: "Pacific Southwest",
    national_champions: 16,
    power_five: true) }
  let!(:team1) { pac_12.teams.create!(school_name: "University of Colorado",
    mascot: "Buffaloes",
    rank: 25,
    private: false) }
  let!(:team2) { pac_12.teams.create!(school_name: "Stanford University",
      mascot: "Cardinals",
      rank: 50,
      private: true) }
  describe "relationships" do
    it { should belong_to :conference }
  end

  describe 'class methods' do
    it '::private_true' do
      expect(Team.private_true).to eq([team2])

    end
  end
end