require 'rails_helper'

RSpec.describe "/teams", type: :feature do
  #user story 3
  describe "As a visitor, when I visit the /teams page" do
    it "I see the attributes of each team in the system" do
      visit "/teams"

      expect(page).to have_content(team1.school_name)
      expect(page).to have_content(team1.mascot)
      expect(page).to have_content(team1.rank)
      expect(page).to have_content(team1.private)

      expect(page).to have_content(team2.school_name)
      expect(page).to have_content(team2.mascot)
      expect(page).to have_content(team2.rank)
      expect(page).to have_content(team2.private)
    end
  end
end