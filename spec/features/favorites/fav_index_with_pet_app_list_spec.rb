require 'rails_helper'

RSpec.describe 'As a visitor', type: :feature do
  before :each do
    shelter_1 = Shelter.create!(
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
      shelter_id: shelter_1.id
    )

    @adoption1 = Adoption.create!(
      name: 'Steve',
      address: '1234 Street Name',
      city: 'Colorado Springs',
      state: 'CO',
      zip: 12345,
      phone_number: '719-987-1234',
      description: 'I am awesome.'
    )

    pet_adoption = PetAdoption.create!(
      pet_id: @pet1.id,
      adoption_id: @adoption1.id
    )

    visit "/pets/#{@pet1.id}"
    click_on 'Add Favorite'

    visit '/favorites'
  end

  it 'can see pets with applications on index' do
    expect(page).to have_content('Pets with applications:')

    within 'section#applied-to-pets' do
      expect(page).to have_content("#{@pet1.name}")

      click_on @pet1.name

      expect(current_path).to eq("/pets/#{@pet1.id}")
    end
  end
end
