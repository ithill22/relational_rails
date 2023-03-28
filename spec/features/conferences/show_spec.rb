require 'rails_helper'

RSpec.describe '/conferences/:id', type: :feature do
  #user story 2
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
  describe "As a visitor, when I visit /conference/:id" do
    it "then i see the conference with the id including the conference's attributes" do

      visit "/conferences/#{pac_12.id}"

      expect(page).to have_content("#{pac_12.name}")
      expect(page).to have_content("Region: #{pac_12.region}")
      expect(page).to have_content("National Championships Won: #{pac_12.national_champions}")
      expect(page).to have_content("Power Five?: #{pac_12.power_five}")

      visit "/conferences/#{big_10.id}"

      expect(page).to have_content("#{big_10.name}")
      expect(page).to have_content("Region: #{big_10.region}")
      expect(page).to have_content("National Championships Won: #{big_10.national_champions}")
      expect(page).to have_content("Power Five?: #{big_10.power_five}")
    end

    it "I see a count of the number of teams associated with this conference" do

      visit "/conferences/#{pac_12.id}"

      expect(page).to have_content("Teams in #{pac_12.name}: #{pac_12.teams.size}")

      visit "/conferences/#{big_10.id}"

      expect(page).to have_content("Teams in #{big_10.name}: #{big_10.teams.size}")
    end

    it "I see a link at the top of the page that take me to the team index page" do
      visit "/conferences/#{pac_12.id}"

      expect(page).to have_link("Private Schools", href: '/teams')

      visit "/conferences/#{big_10.id}"

      expect(page).to have_link("Private Schools", href: '/teams')
    end

    it "I see a link at the top of the page that takes me to the conference index page" do
      visit "/conferences/#{big_10.id}"

      expect(page).to have_link("Conferences", href: '/conferences')

      visit "/conferences/#{pac_12.id}"

      expect(page).to have_link("Conferences", href: '/conferences')
    end

    it "I see a link to take me that conference's team index page" do
      visit "/conferences/#{pac_12.id}"

      expect(page).to have_link("#{pac_12.name} Teams")

      visit "/conferences/#{big_10.id}"

      expect(page).to have_link("#{big_10.name} Teams")
    end

    it "I see a link to update the conference, 'Update Conference'" do
      visit "/conferences/#{pac_12.id}"

      expect(page).to have_selector(:link_or_button, "Update Conference")
    end

    describe "When I click 'Update Conference'" do
      it "I am taken to 'conferences/:id/edit' where I see a form to update the conference's attributes" do
        visit "/conferences/#{pac_12.id}"
        click_button "Update Conference"

        expect(current_path).to eq("/conferences/#{pac_12.id}/edit")
      end
    end
    it "I see a link to delete the parent" do
      visit "/conferences/#{pac_12.id}"

      expect(page).to have_selector(:link_or_button, "Delete Conference")
    end

    it "When I click on delete conference, the parent and all children are deleted and I am redirected to the conference index page where the conference is no longer visible" do
      visit "/conferences/#{pac_12.id}"
      click_button "Delete Conference"

      expect(current_path).to eq("/conferences")
      expect(page).to_not have_content(pac_12.name)
    end
  end
end