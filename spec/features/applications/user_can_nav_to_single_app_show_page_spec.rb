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

    pet_adoption = pet_adoption.create!(pet_id: @pet1.id, adoption_id: @application1.id)
  end
  it 'can see attributes of the app and a link to name of pets' do
  visit "/applications/#{@application1.id}"

  expect(page).to have_content('Steve')
  expect(page).to have_content(@application1.address)
  expect(page).to have_content(@application1.city)
  expect(page).to have_content(@application1.state)
  expect(page).to have_content(@application1.zip)
  expect(page).to have_content(@application1.phone_number)
  expect(page).to have_content(@application1.description)
  expect(page).to have_link(@pet1.name)
end 

end

# names of all pet's that this application is for (all names of pets should be links to their show page)
