require 'rails_helper'

RSpec.describe 'contestants index page' do
  it "I see a unique list of all of the hometowns that these contestants are from" do
    hannah = Bachelorette.create!(name: "Hannah Brown", season_number: 15, season_description: "The most dramatic season yet!")

    andrew = Contestant.create!(name: "Andrew Austen", age: 27, hometown: "Los Angeles", bachelorette: hannah)
    michael = Contestant.create!(name: "Michael Scott", age: 29, hometown: "New York City", bachelorette: hannah)
    ben = Contestant.create!(name: "Ben Smith", age: 24, hometown: "Miami", bachelorette: hannah)

    visit "/bachelorettes/#{hannah.id}/contestants"

    within "#hometowns" do
      expect(page).to have_content(andrew.hometown)
      expect(page).to have_content(michael.hometown)
      expect(page).to have_content(ben.hometown)
    end
  end
end
