require 'rails_helper'

RSpec.describe "/conferences", type: :feature do
  # User Story 1
  let!(:pac_12) { Conference.create!(name: "Pac-12", 
                                region: "Pacific Southwest",
                                national_champions: 16,
                                power_five: true) }
  let!(:big_10) { Conference.create!(name: "Big 10",
                               region: "Upper Midwest",
                               national_champions: 10,
                               power_five: true) }
  describe "as a visitor, when I visit the conference index page" do
    it "I see the name of each conference" do
      visit "/conferences"

      save_and_open_page
      expect(page).to have_content(pac_12.name)
      expect(page).to have_content(big_10.name)
    end
  end
end