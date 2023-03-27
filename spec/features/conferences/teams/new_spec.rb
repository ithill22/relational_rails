require 'rails_helper'

RSpec.describe "/conferences/:conference_id/teams/new", type: :feature do
  let!(:pac_12) { Conference.create!(name: "Pac-12", 
    region: "Pacific Southwest",
    national_champions: 16,
    power_five: true) }
    
  describe "As a visitor, when I visit the new team page" do
    describe "I see a form for a new team record" do
      it "When I fill out the form with a new team's attributes" do
        visit "/conferences/#{pac_12.id}/teams/new"
        fill_in "School Name:", with: "Stanford"
        fill_in "Mascot", with: "Cardinal"
        fill_in "Rank:", with: 30
        choose "Yes"

        expect(page).to have_field("School Name:", with: "Stanford")
        expect(page).to have_field("Mascot:", with: "Cardinal")
        expect(page).to have_field("Rank:", with: 30)
        expect(page).to have_checked_field("Yes")
      end 

      describe "I click the button 'Create Team' to submit the form" do
        it "a 'POST' request is sent to '/conference/:conference_id/teams', a new team record is created and I am redirected to the conference teams index page" do
          visit "/conferences/#{pac_12.id}/teams/new"
          fill_in "School Name:", with: "Stanford"
          fill_in "Mascot", with: "Cardinal"
          fill_in "Rank:", with: 30
          choose "Yes"
          click_on "Create Team"
          new_team = Team.all.where(school_name: "Stanford")

          expect(current_path).to eq("/conferences/#{pac_12.id}/teams")
          expect(page).to have_content("Stanford")
        end
      end
    end
  end 
end