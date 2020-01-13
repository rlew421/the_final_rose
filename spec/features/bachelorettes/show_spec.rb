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

  it "I can click a link to that bachelorette's contestants index page and see those contestants' info" do
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

    click_link "#{andrew.name}"

    expect(current_path).to eq("/contestants/#{andrew.id}")
  end

  it "I see the average age of all of that bachelorette's conestants" do
    hannah = Bachelorette.create!(name: "Hannah Brown", season_number: 15, season_description: "The most dramatic season yet!")

    andrew = Contestant.create!(name: "Andrew Austen", age: 27, hometown: "Los Angeles", bachelorette: hannah)
    michael = Contestant.create!(name: "Michael Scott", age: 29, hometown: "New York City", bachelorette: hannah)
    dylan = Contestant.create!(name: "Dylan Gomez", age: 35, hometown: "Chicago", bachelorette: hannah)

    visit "/bachelorettes/#{hannah.id}"

    expect(page).to have_content("Average contestant age: #{hannah.average_contestant_age}")
  end
end
