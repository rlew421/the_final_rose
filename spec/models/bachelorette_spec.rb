require 'rails_helper'

RSpec.describe Bachelorette, type: :model do
  describe 'relationships' do
    it {should have_many :contestants}
  end

  describe 'instance methods' do
    it "average_contestant_age" do
      hannah = Bachelorette.create!(name: "Hannah Brown", season_number: 15, season_description: "The most dramatic season yet!")

      andrew = Contestant.create!(name: "Andrew Austen", age: 27, hometown: "Los Angeles", bachelorette: hannah)
      michael = Contestant.create!(name: "Michael Scott", age: 29, hometown: "New York City", bachelorette: hannah)
      dylan = Contestant.create!(name: "Dylan Gomez", age: 35, hometown: "Chicago", bachelorette: hannah)

      expect(hannah.average_contestant_age).to eq(30.3)
    end
  end
end
