require 'rails_helper'

RSpec.describe 'As a user', type: :feature do
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
  end

  describe 'as a visitor' do
    it 'can see an empty favorites page' do
      visit '/shelters'

      click_on 'Favorites: 0'

      expect(current_path).to eq('/favorites')
      expect(page).to have_content "You have no pets!"
    end

    it 'can see all pets on a favorites index page' do
      visit "/pets/#{@pet1.id}"

      within "#pet-#{@pet1.id}" do
        click_on 'Add Favorite'
      end

      click_on 'Favorited: '
    end
  end
end
