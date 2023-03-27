require 'rails_helper'

RSpec.describe Conference, type: :model do
  let!(:pac_12) { Conference.create!(name: "Pac-12", 
                                     region: "Pacific Southwest",
                                     national_champions: 16,
                                     power_five: true) }
  let!(:big_10) { Conference.create!(name: "Big 10",
                                     region: "Upper Midwest",
                                     national_champions: 10,
                                     power_five: true) }
  let!(:team1) { pac_12.teams.create!(school_name: "University of Colorado",
                                      mascot: "Buffaloes",
                                      rank: 25,
                                      private: false) }
  let!(:team2) { big_10.teams.create!(school_name: "University of Iowa",
                                      mascot: "Hawkeyes",
                                      rank: 13,
                                      private: false) } 

  describe "relationships" do
    it { should have_many :teams }
  end

  describe 'instance methods' do
    it '::order_by_created_at' do

      expect(Conference.order_by_created_at).to eq([pac_12, big_10])
    end

    it '#number_of_teams' do

      expect(pac_12.number_of_teams).to eq(1)
    end
  end
end