require 'rails_helper'

RSpec.describe "/conferences", type: :feature do
  # User Story 1
  let!(:pac_12) { Conference.create!(name: "Pac-12", 
                                     region: "Pacific Southwest",
                                     national_champions: 16,
                                     power_five: true) }
  sleep(1)
  let!(:big_10) { Conference.create!(name: "Big 10",
                                     region: "Upper Midwest",
                                     national_champions: 10,
                                     power_five: true) }
  describe "as a visitor, when I visit the /conferences" do
    it "I see the name of each conference" do
      visit "/conferences"

      expect(page).to have_content("#{pac_12.name}")
      expect(page).to have_content("#{big_10.name}")
    end

    it "I see that records are ordered by most recently created and I can see when each record was created" do
      visit "/conferences"

      expect(page).to have_content("Created: #{pac_12.created_at}")
      expect(page).to have_content("Created: #{big_10.created_at}")
      expect(pac_12.name).to appear_before(big_10.name)
    end

    it "I see a link at the top of the page that take me to the team index page" do
      visit "/conferences"

      expect(page).to have_link("Teams", href: '/teams')
    end

    it "I see a link at the top of the page that takes me to the conference index page" do
      visit "/conferences"

      expect(page).to have_link("Conferences", href: '/conferences')
    end

    it "I see a link to create a new conference record, 'New Conference'" do
      visit "/conferences"

      expect(page).to have_selector(:link_or_button, "New Conference")
    end

    describe "When I click 'New Conference'" do
      it "I am taken to 'conferences/new' where I see a form for a new conference record" do
        visit "/conferences"
        click_button "New Conference"

        expect(current_path).to eq("/conferences/new")
      end
    end
  end
end