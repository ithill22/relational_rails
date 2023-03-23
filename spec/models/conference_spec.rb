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
  describe "relationships" do
    it { should have_many :teams }
  end

  describe 'instance methods' do
    it '#order_by_created_at' do

      expect(Conference.order_by_created_at).to eq(pac_12, big_10)
    end
  end
end