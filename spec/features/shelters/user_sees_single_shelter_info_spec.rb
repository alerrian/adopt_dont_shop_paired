require 'rails_helper'

RSpec.describe "On the single shelter page", type: :feature do
  it "sees all attributes of the shelter" do
    shelter_1 = Shelter.create!(name: "John's Shelter",
                              address: "1550 East 15th",
                              city: "Denver",
                              state: "Colorado",
                              zip: 80206
                            )
    shelter_2 = Shelter.create!(name: "Mountain Shelter",
                              address: "1234 West 12th",
                              city: "Denver",
                              state: "Colorado",
                              zip: 80204
                            )

    visit "/shelters/#{shelter_1.id}"

    expect(page).to have_content(shelter_1.name)
    expect(page).to have_content(shelter_1.address)
    expect(page).to have_content(shelter_1.city)
    expect(page).to have_content(shelter_1.state)
    expect(page).to have_content(shelter_1.zip)
  end
end

  
