require 'rails_helper'

RSpec.describe 'outing show page' do
  it "I see that outing's:
  - name
  - location
  - date
  - total count of contestants that were on this outing
  - list of all names of the contestants that went on this outing" do

    hannah = Bachelorette.create!(name: "Hannah Brown", season_number: 15, season_description: "The most dramatic season yet!")

    andrew = Contestant.create!(name: "Andrew Austen", age: 27, hometown: "Los Angeles", bachelorette: hannah)
    michael = Contestant.create!(name: "Michael Scott", age: 29, hometown: "New York City", bachelorette: hannah)
    ben = Contestant.create!(name: "Ben Smith", age: 24, hometown: "Miami", bachelorette: hannah)

    kickball = Outing.create!(name: "Kickball", location: "Hawaii", date: Time.now)
    ContestantOuting.create!(contestant: andrew, outing: kickball)
    ContestantOuting.create!(contestant: michael, outing: kickball)

    hot_springs = Outing.create!(name: "Hot Springs", location: "Japan", date: Time.now)
    ContestantOuting.create!(contestant: andrew, outing: hot_springs)
    ContestantOuting.create!(contestant: ben, outing: hot_springs)

    visit "/outings/#{kickball.id}"

    expect(page).to have_content(kickball.name)
    expect(page).to have_content(kickball.location)
    expect(page).to have_content(kickball.date)
    expect(page).to have_content("Number of Contestants: 2")

    within "#contestants" do
      expect(page).to have_content(andrew.name)
      expect(page).to have_content(michael.name)
      expect(page).to_not have_content(ben.name)
    end
  end
end
