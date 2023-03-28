require 'rails_helper'

RSpec.describe "", type: :feature do
  describe "When visit the welcome index page" do
    it "i see a link to get to the conferences page" do
      visit ""
      click_link "Get Started"

      expect(current_path).to eq("/conferences")
    end
  end
end