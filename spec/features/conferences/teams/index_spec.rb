require 'rails_helper'

RSpec.describe "/conferences/:conference_id/teams", type: :feature do
  #user story 5
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
  let!(:team3) { pac_12.teams.create!(school_name: "Stanford University",
      mascot: "Cardinals",
      rank: 50,
      private: true) }
  let!(:team2) { big_10.teams.create!(school_name: "University of Iowa",
      mascot: "Hawkeyes",
      rank: 13,
      private: false) }  
  let!(:team4) { big_10.teams.create!(school_name: "Ohio State University",
      mascot: "Buckeyes",
      rank: 1,
      private: false) }  
  
  describe 'As a visitory, when i visit /conferences/:conference_id/teams' do
    it "Then I see each team that is associated with that conference with each team's attributes" do

      visit "/conferences/#{pac_12.id}/teams"
save_and_open_page
      expect(page).to have_content(team1.school_name)
      expect(page).to have_content(team1.mascot)
      expect(page).to have_content(team1.rank)
      expect(page).to have_content(team1.private)

      expect(page).to have_content(team3.school_name)
      expect(page).to have_content(team3.mascot)
      expect(page).to have_content(team3.rank)
      expect(page).to have_content(team3.private)

      visit "/conferences/#{big_10.id}/teams"

      expect(page).to have_content(team2.school_name)
      expect(page).to have_content(team2.mascot)
      expect(page).to have_content(team2.rank)
      expect(page).to have_content(team2.private)

      expect(page).to have_content(team4.school_name)
      expect(page).to have_content(team4.mascot)
      expect(page).to have_content(team4.rank)
      expect(page).to have_content(team4.private)
    end
  end
end