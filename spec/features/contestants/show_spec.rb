require 'rails_helper'

RSpec.describe 'contestant show page' do
  it "I see that contestant's name as well as the season number, season description, and a list of names of the outings this contestant has been on and each outing name is a link" do
    hannah = Bachelorette.create!(name: "Hannah Brown", season_number: 15, season_description: "The most dramatic season yet!")

    andrew = Contestant.create!(name: "Andrew Austen", age: 27, hometown: "Los Angeles", bachelorette: hannah)

    outing_1 = andrew.outings.create!(name: "Kickball", location: "Hawaii", date: Time.now)
    outing_2 = andrew.outings.create!(name: "Hot Springs", location: "Japan", date: Time.now)
    outing_3 = andrew.outings.create!(name: "Helicopter Ride", location: "Bali", date: Time.now)

    visit "/contestants/#{andrew.id}"

    expect(page).to have_content(andrew.name)
    expect(page).to have_content(hannah.season_number)
    expect(page).to have_content(hannah.season_description)

    expect(page).to have_link("#{outing_1.name}")
    expect(page).to have_link("#{outing_2.name}")
    click_link("#{outing_3.name}")

    expect(current_path).to eq("/outings/#{outing_3.id}")
  end
end
