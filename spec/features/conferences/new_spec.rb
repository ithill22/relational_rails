require 'rails_helper'

RSpec.describe "/conferences/new", type: :feature do
  describe "As a visitor, when I visit the new conference page" do
    describe "I see a form for a new conference record" do
      it "When I fill ou the form with a new conference's attributes" do
        visit "/conferences/new"
        fill_in "Name:", with: "Big 12"
        fill_in "Region:", with: "Midwest"
        fill_in "Number of National Championships Won by conference:", with: 12
        choose "Yes"

        expect(page).to have_field("Name:", with: "Big 12")
        expect(page).to have_field("Region:", with: "Midwest")
        expect(page).to have_field("Number of National Championships Won by conference:", with: 12)
        expect(page).to have_checked_field("Yes")
      end 

      describe "I click the button 'Create Conference' to submit the form" do
        it "a 'POST' request is sent to '/conference', a new conference record is created and I am redirected to the conference index page" do
          visit "/conferences/new"
          fill_in "Name:", with: "Big 12"
          fill_in "Region:", with: "Midwest"
          fill_in "Number of National Championships Won by conference:", with: 12
          choose "Yes"
          click_on "Create Conference"
          new_conf = Conference.all.where(name: "Big 12")

          expect(current_path).to eq('/conferences')
          expect(page).to have_content("Big 12")
        end
      end
    end
  end
end    