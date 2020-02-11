require 'rails_helper'

RSpec.describe 'When visits a single app show page' do
  before :each do
    @shelter_1 = Shelter.create!(
      name: "John's Shelter",
      address: '1550 East 15th',
      city: 'Denver',
      state: 'Colorado',
      zip: 80206
    )
    @pet1 = Pet.create!(
      image: 'https://gardenandgun.com/wp-content/uploads/2018/04/cash.jpg',
      name: 'Nala',
      description: 'Black lab',
      age: '2',
      sex: 'female',
      adoptable: 'yes',
      shelter_id: @shelter_1.id
    )

    @pet2 = Pet.create(
      image: 'https://huhinteresting.files.wordpress.com/2009/07/buddy31.jpg',
      name: 'Leo',
      description: 'Big dog',
      age: '4',
      sex: 'male',
      adoptable: 'yes',
      shelter_id: @shelter_1.id
    )

    @application1 = Adoption.create!(
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
    click_on 'Active Applications'

    expect(current_path).to eq("/pets/#{@pet1.id}/adoptions")
    click_on 'Steve'
    expect(current_path).to eq("/adoptions/#{@application1.id}")
  end

  it 'if pet has no apps message shows' do
    visit "pets/#{@pet2.id}/adoptions/"
    expect(page).to have_content("There are no applications for #{@pet2.name} yet.")
  end
end
