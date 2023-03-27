require 'rails_helper'

RSpec.describe 'conferences/:id/edit', type: :feature do
  let!(:big_10) { Conference.create!(name: "Big 10",
    region: "Upper Midwest",
    national_champions: 10,
    power_five: true) }
  describe "As a visitor, when I visit the edit conference page" do
    describe "I see a form to edit the conference's attributes" do
      it "When I fill out the form with update information" do
        visit "/conferences/#{big_10.id}"
        click_button "Update Conference"
        fill_in "Name:", with: "Test 12"
        fill_in "Region:", with: "MidTest"
        fill_in "Number of National Championships Won by conference:", with: 1
        choose "No"

        expect(page).to have_field("Name:", with: "Test 12")
        expect(page).to have_field("Region:", with: "MidTest")
        expect(page).to have_field("Number of National Championships Won by conference:", with: 1)
        expect(page).to have_checked_field("No")
      end

      describe "I click the button to submit the form" do
        it "a 'PATCH' request is sent to '/conferences/:id', the conferences info is update and I am redirected to the conference's show page where I see updated info" do
          visit "/conferences/#{big_10.id}"
        click_button "Update Conference"
        fill_in "Name:", with: "Test 12"
        fill_in "Region:", with: "MidTest"
        fill_in "Number of National Championships Won by conference:", with: 1
        choose "No"
        click_on "Update Conference"

        expect(current_path).to eq("/conferences/#{big_10.id}")
        expect(page).to have_content("Test 12")
        end
      end
    end
  end
end