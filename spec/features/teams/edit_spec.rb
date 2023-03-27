require 'rails_helper'

RSpec.describe 'teams/:id/edit', type: :feature do
  let!(:big_10) { Conference.create!(name: "Big 10",
    region: "Upper Midwest",
    national_champions: 10,
    power_five: true) }
  let!(:team1) { pac_12.teams.create!(school_name: "University of Colorado",
    mascot: "Buffaloes",
    rank: 25,
    private: false) }
  describe "As a visitor, when I visit the edit team page" do
    describe "I see a form to edit the team's attributes" do
      it "When I fill out the form with updated information" do
        visit "/teams/#{team1.id}"
        click_button "Update Team"
        fill_in "School Name:", with: "Test U"
        fill_in "Mascot:", with: "Tested"
        fill_in "Rank:", with: 3
        choose "Yes"

        expect(page).to have_field("School Name:", with: "Test U")
        expect(page).to have_field("Mascot:", with: "Tested")
        expect(page).to have_field("Rank:", with: 3)
        expect(page).to have_checked_field("Yes")
      end

      describe "I click the button to submit the form" do
        it "a 'PATCH' request is sent to '/teams/:id', the team's info is updated and I am redirected to the team's show page where I see updated info" do
          visit "/teams/#{team1.id}"
        click_button "Update Team"
        fill_in "School Name:", with: "Test U"
        fill_in "Mascot:", with: "Tested"
        fill_in "Rank:", with: 3
        choose "Yes"
        click_on "Update Team"

        expect(current_path).to eq("/teams/#{team1.id}")
        expect(page).to have_content("Test U")
        end
      end
    end
  end
end