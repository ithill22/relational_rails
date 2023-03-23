require 'rails_helper'

RSpec.describe '/teams/:id', type: :feature do
  #user story 4
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
                            
  describe "As a visitor, when I visity /teams/:id" do
    it "I see the team with that id including the team's attributes" do

      visit "/teams/#{team1.id}"

      expect(page).to have_content("#{team1.school_name}")
      expect(page).to have_content("Mascot: #{team1.mascot}")
      expect(page).to have_content("Rank: #{team1.rank}")
      expect(page).to have_content("Private School?: #{team1.private}")

      visit "/teams/#{team2.id}"

      expect(page).to have_content("#{team2.school_name}")
      expect(page).to have_content("Mascot: #{team2.mascot}")
      expect(page).to have_content("Rank: #{team2.rank}")
      expect(page).to have_content("Private School?: #{team2.private}")
    end
  end
end