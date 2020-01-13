require 'rails_helper'

RSpec.describe 'bachelorette show page' do
  it "I see that bachelorette's info including:
  - name
  - season number
  - description of season that they were on" do

    hannah = Bachelorette.create!(name: "Hannah Brown", season_number: 15, season_description: "The most dramatic season yet!")

    visit "/bachelorettes/#{hannah.id}"

    expect(page).to have_content("Name: #{hannah.name}")
    expect(page).to have_content("Season Number: #{hannah.season_number}")
    expect(page).to have_content("Season Description: #{hannah.season_description}")
  end

  it "I see a link to that bachelorette's contestants" do
    hannah = Bachelorette.create!(name: "Hannah Brown", season_number: 15, season_description: "The most dramatic season yet!")
    emily = Bachelorette.create!(name: "Emily Adams", season_number: 5, season_description: "The wildest season yet!")

    andrew = Contestant.create!(name: "Andrew Austen", age: 27, hometown: "Los Angeles", bachelorette: hannah)
    michael = Contestant.create!(name: "Michael Scott", age: 29, hometown: "New York City", bachelorette: hannah)
    ben = Contestant.create!(name: "Ben Smith", age: 24, hometown: "Miami", bachelorette: emily)

    visit "/bachelorettes/#{hannah.id}"

    click_link "View the contestants for season #{hannah.season_number}"

    expect(current_path).to eq("/bachelorettes/#{hannah.id}/contestants")

    expect(page).to have_content(andrew.name)
    expect(page).to have_content(andrew.age)
    expect(page).to have_content(andrew.hometown)
    expect(page).to have_content(michael.name)
    expect(page).to have_content(michael.age)
    expect(page).to have_content(michael.hometown)
    expect(page).to_not have_content(ben.name)
  end
end
