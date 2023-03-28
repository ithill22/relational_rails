require 'rails_helper'

RSpec.describe "/teams", type: :feature do
  #user story 3
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
                                      private: true) }
  let!(:team2) { big_10.teams.create!(school_name: "University of Iowa",
                                      mascot: "Hawkeyes",
                                      rank: 13,
                                      private: false) }                            
  describe "As a visitor, when I visit the /teams page" do
    it "I see the attributes of each team in the system" do
      visit "/teams"

      expect(page).to have_content("#{team1.school_name}")
      expect(page).to have_content("Mascot: #{team1.mascot}")
      expect(page).to have_content("Rank: #{team1.rank}")
      expect(page).to have_content("Private School?: #{team1.private}")
    end

    it "I see a link at the top of the page that take me to the team index page" do
      visit "/teams"

      expect(page).to have_link("Teams", href: '/teams')
    end

    it "I see a link at the top of the page that takes me to the conference index page" do
      visit "/teams"

      expect(page).to have_link("Conferences", href: '/conferences')
    end

    it "I see a link to edit each team's info" do
      visit "/teams"

      expect(page).to have_selector(:link_or_button, "Edit")

      click_button("Edit", match: :first)

      expect(current_path).to eq("/teams/#{team1.id}/edit")
    end

    it "has a delete button next to each team" do
      visit "/teams"
      click_button("Delete", match: :first)

      expect(current_path).to eq("/teams")
      expect(page).to_not have_content(team1.school_name)
    end
  end
end