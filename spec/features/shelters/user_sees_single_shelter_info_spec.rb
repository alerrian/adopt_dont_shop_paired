require 'rails_helper'

RSpec.describe 'On the single shelter page', type: :feature do
  before :each do
    @shelter_1 = Shelter.create!(
      name: "John's Shelter",
      address: '1550 East 15th',
      city: 'Denver',
      state: 'Colorado',
      zip: 80206
    )
    pet1 = Pet.create!(
      image: 'https://gardenandgun.com/wp-content/uploads/2018/04/cash.jpg',
      name: 'Nala',
      description: 'Black lab',
      age: '2',
      sex: 'female',
      adoptable: 'Adoptable',
      shelter_id: @shelter_1.id
    )

    review1 = Review.create!(
      title: 'Test Review',
      rating: '5',
      content: 'This is a great test shelter',
      image: '',
      shelter_id: @shelter_1.id
    )

    review2 = Review.create!(
      title: 'Test Review',
      rating: '2',
      content: 'This is a great test shelter',
      image: '',
      shelter_id: @shelter_1.id
    )

    adoption1 = Adoption.create!(
      name: 'Steve',
      address: '1234 S. North Street Road',
      city: 'The Place I feel Safest',
      state: 'CO',
      zip: '06111',
      phone_number: '719-123-4567',
      description: 'I love this animal so much! I would be great.'
    )

    PetAdoption.create!(pet_id: pet1.id, adoption_id: adoption1.id)
  end

  it 'sees all attributes of the shelter' do
    visit "/shelters/#{@shelter_1.id}"

    expect(page).to have_content(@shelter_1.name)
    expect(page).to have_content(@shelter_1.address)
    expect(page).to have_content(@shelter_1.city)
    expect(page).to have_content(@shelter_1.state)
    expect(page).to have_content(@shelter_1.zip)
  end

  it 'can see shelter stats' do
    visit "/shelters/#{@shelter_1.id}"

    expect(page).to have_content('Pet Count: 1')
    expect(page).to have_content('Average Rating: 3')
    expect(page).to have_content('Application Count: 1')
  end
end
