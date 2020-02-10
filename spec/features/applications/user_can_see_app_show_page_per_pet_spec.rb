require 'rails_helper'

RSpec.describe "When visits a single app show page" do
  before :each do
    @shelter_1 = Shelter.create!(
      name: "John's Shelter",
      address: '1550 East 15th',
      city: 'Denver',
      state: 'Colorado',
      zip: 80206
    )
    @pet1 = Pet.create(
      image: 'https://gardenandgun.com/wp-content/uploads/2018/04/cash.jpg',
      name: 'Nala',
      description: 'Black lab',
      age: '2',
      sex: 'female',
      adoptable: 'yes',
      shelter_id: @shelter_1.id
    )

    @application1 = Adoption.create(
      name: "Steve",
      address:'1234 S. North Street Road',
      city:'The Place I feel Safest',
      state:'CO',
      zip:'06111',
      phone_number: '719-123-4567',
      description:'I love this animal so much! I would be great.'
    )

    pet_adoption = PetAdoption.create!(pet_id: @pet1.id, adoption_id: @application1.id)
  end

  it 'can see apps in progress from pet show page ' do
    visit "/pets/#{@pet1.id}"
      click_on "Active Applications"

      expect(current_path).to eq("/pets/#{@pet1.id}/adoptions")
      click_on ('Steve')
      expect(current_path).to eq("/adoptions/#{@application1.id}")

end

end

# As a visitor
# When I visit a pets show page
# I see a link to view all applications for this pet
# When I click that link
# I can see a list of all the names of applicants for this pet
# Each applicant's name is a link to their application show page