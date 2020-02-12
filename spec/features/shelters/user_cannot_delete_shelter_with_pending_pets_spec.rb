require 'rails_helper'

RSpec.describe 'As a visitor', type: :feature do
  context 'when I delete a shelter' do
    before :each do
      @shelter1 = Shelter.create!(
        name: "John's Shelter",
        address: '1550 East 15th',
        city: 'Denver',
        state: 'Colorado',
        zip: 80206
      )

      pet1 = Pet.create(
        image: 'https://gardenandgun.com/wp-content/uploads/2018/04/cash.jpg',
        name: 'Nala',
        description: 'Black lab',
        age: '2',
        sex: 'female',
        adoptable: 'Pending adoption by Steve',
        shelter_id: @shelter1.id
      )

      pet2 = Pet.create(
        image: 'https://huhinteresting.files.wordpress.com/2009/07/buddy31.jpg',
        name: 'Leo',
        description: 'Big dog',
        age: '4',
        sex: 'male',
        adoptable: 'Adoptable',
        shelter_id: @shelter1.id
      )
    end

    it 'cannot delete a pet with pending status' do
      visit "/shelters/#{@shelter1.id}"

      click_on 'Delete Shelter'

      expect(current_path).to eq("/shelters/#{@shelter1.id}")
      expect(page).to have_content('You cannot delete this shelter.') 
    end
  end
end
