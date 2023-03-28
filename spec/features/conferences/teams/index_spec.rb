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
  
  describe 'As a visitor, when i visit /conferences/:conference_id/teams' do
    it "Then I see each team that is associated with that conference with each team's attributes" do

      visit "/conferences/#{pac_12.id}/teams"

      expect(page).to have_content("School Name: #{team1.school_name}")
      expect(page).to have_content("Mascot: #{team1.mascot}")
      expect(page).to have_content("Rank: #{team1.rank}")
      expect(page).to have_content("Private School?: #{team1.private}")

      expect(page).to have_content("School Name: #{team3.school_name}")
      expect(page).to have_content("Mascot: #{team3.mascot}")
      expect(page).to have_content("Rank: #{team3.rank}")
      expect(page).to have_content("Private School?: #{team3.private}")

      visit "/conferences/#{big_10.id}/teams"

      expect(page).to have_content("School Name: #{team2.school_name}")
      expect(page).to have_content("Mascot: #{team2.mascot}")
      expect(page).to have_content("Rank: #{team2.rank}")
      expect(page).to have_content("Private School?: #{team2.private}")

      expect(page).to have_content("School Name: #{team4.school_name}")
      expect(page).to have_content("Mascot: #{team4.mascot}")
      expect(page).to have_content("Rank: #{team4.rank}")
      expect(page).to have_content("Private School?: #{team4.private}")
    end

    it "I see a link at the top of the page that take me to the team index page" do
      visit "/conferences/#{pac_12.id}/teams"

      expect(page).to have_link("Teams", href: '/teams')

      visit "/conferences/#{big_10.id}/teams"

      expect(page).to have_link("Teams", href: '/teams')
    end

    it "I see a link at the top of the page that takes me to the conference index page" do
      visit "/conferences/#{big_10.id}/teams"

      expect(page).to have_link("Conferences", href: '/conferences')

      visit "/conferences/#{pac_12.id}/teams"

      expect(page).to have_link("Conferences", href: '/conferences')
    end

    it "I see a link to create a new team record, 'Create Team'" do
      visit "/conferences/#{pac_12.id}/teams"

      expect(page).to have_selector(:link_or_button, "Create Team")
    end

    describe "When I click 'Create Team'" do
      it "I am taken to 'conferences/:conference_id/teams/new' where I see a form for a new conference record" do
        visit "/conferences/#{pac_12.id}/teams"
        click_button "Create Team"

        expect(current_path).to eq("/conferences/#{pac_12.id}/teams/new")
      end
    end

    it "I can see a link to sort teams in alphabetical order" do
      visit "/conferences/#{pac_12.id}/teams"

      expect(team1.school_name).to appear_before(team3.school_name)

      click_link "A-Z"

      expect(page).to have_current_path("/conferences/#{pac_12.id}/teams?order=a-z")
      expect(team3.school_name).to appear_before(team1.school_name)
      
      visit "/conferences/#{big_10.id}/teams"

      expect(team2.school_name).to appear_before(team4.school_name)

      click_link "A-Z"

      expect(page).to have_current_path("/conferences/#{big_10.id}/teams?order=a-z")
      expect(team4.school_name).to appear_before(team2.school_name)
    end

    it "I see a link to edit each team's info" do
      visit "/conferences/#{pac_12.id}/teams"

      expect(page).to have_selector(:link_or_button, "Edit")

      click_button("Edit", match: :first)

      expect(current_path).to eq("/teams/#{team1.id}/edit")
    end
  end
end