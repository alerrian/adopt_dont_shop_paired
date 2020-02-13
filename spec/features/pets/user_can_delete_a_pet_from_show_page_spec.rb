require 'rails_helper'

RSpec.describe 'update pet page', type: :feature do
  describe 'while visiting  pet show page ' do
    before :each do
      @shelter_1 = Shelter.create(
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
    end

    it 'can delete a pet' do
      visit "/pets/#{@pet1.id}"
      click_on 'Add Favorite'
      click_on 'Delete Pet'

      expect(current_path).to eq('/pets')
      expect(page).to_not have_content('Nala')
    end

    it 'can delete a pet' do
      pet2 = Pet.create(
        image: 'https://gardenandgun.com/wp-content/uploads/2018/04/cash.jpg',
        name: 'Nala',
        description: 'Black lab',
        age: '2',
        sex: 'female',
        adoptable: 'Pending',
        shelter_id: @shelter_1.id
      )

      visit "/pets/#{pet2.id}"
      click_on 'Add Favorite'
      click_on 'Delete Pet'
      expect(page).to have_content('You cannot delete this pet.')

    end
  end
end
