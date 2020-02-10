require 'rails_helper'

RSpec.describe 'As a visitor', type: :feature do
  before :each do
    @shelter1 = Shelter.create!(
      name: "John's Shelter",
      address: '1550 East 15th',
      city: 'Denver',
      state: 'Colorado',
      zip: 80206
    )
    @shelter2 = Shelter.create!(
      name: 'Mountain Shelter',
      address: '1234 West 12th',
      city: 'Denver',
      state: 'Colorado',
      zip: 80204
    )

    @pet1 = Pet.create!(
      image: 'https://gardenandgun.com/wp-content/uploads/2018/04/cash.jpg',
      name: 'Nala',
      description: 'Black lab',
      age: '2',
      sex: 'female',
      adoptable: 'yes',
      shelter_id: @shelter1.id
    )
    @pet2 = Pet.create!(
      image: 'https://huhinteresting.files.wordpress.com/2009/07/buddy31.jpg',
      name: 'Leo',
      description: 'Big dog',
      age: '4',
      sex: 'male',
      adoptable: 'yes',
      shelter_id: @shelter2.id
    )

    visit "/pets/#{@pet1.id}"
    click_on 'Add Favorite'
    visit "/pets/#{@pet2.id}"
    click_on 'Add Favorite'

    visit '/favorites'
  end

  it 'can see a link for adopting pets' do
    expect(page).to have_link('Adopt Favorite Pets')
  end

  it 'can use link to navigate to new application form' do
    click_on 'Adopt Favorite Pets'

    expect(current_path).to eq('/adoptions/new')
  end

  it 'has a form to fill out' do
    visit '/adoptions/new'

    within "section#pet_#{@pet1.id}" do
      check "adopted_pet_"
    end

    fill_in 'name', with: 'Steve'
    fill_in 'address', with: '1234 S. North Street Road'
    fill_in 'city', with: 'The Place I feel Safest'
    fill_in 'state', with: 'CO'
    fill_in 'zip', with: '06111'
    fill_in 'phone_number', with: '719-123-4567'
    fill_in 'description', with: 'I love this animal so much! I would be great.'

    click_on 'Submit Application'

    expect(page).to have_content('Application submitted successfully!')
    expect(current_path).to eq('/favorites')

    expect(page).not_to have_content(@pet1.name)
    expect(page).to have_content(@pet2.name)
  end
end
