require 'rails_helper'

RSpec.describe '/conferences/:id', type: :feature do
  #user story 2
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
  describe "As a visitor, when I visit /conference/:id" do
    it "then i see the conference with the id including the conference's attributes" do

      visit "/conferences/#{pac_12.id}"

      expect(page).to have_content(pac_12.name)
      expect(page).to have_content(pac_12.region)
      expect(page).to have_content(pac_12.national_champions)
      expect(page).to have_content(pac_12.power_five)

      visit "/conferences/#{big_10.id}"

      expect(page).to have_content(big_10.name)
      expect(page).to have_content(big_10.region)
      expect(page).to have_content(big_10.national_champions)
      expect(page).to have_content(big_10.power_five)
    end

    it "I see a count of the number of teams associated with this conference" do

      visit "/conferences/#{pac_12.id}"

      expect(page).to have_content(pac_12.teams.size)

      visit "/conferences/#{big_10.id}"

      expect(page).to have_content(big_10.teams.size)
    end
  end
end