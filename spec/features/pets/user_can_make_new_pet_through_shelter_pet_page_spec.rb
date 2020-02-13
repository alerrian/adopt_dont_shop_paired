require 'rails_helper'

RSpec.describe 'create pet page', type: :feature do
  describe 'while visiting shelter pet index' do
    it 'can create a new pet' do
      shelter_1 = Shelter.create(
        name: "John's Shelter",
        address: '1550 East 15th',
        city: 'Denver',
        state: 'Colorado',
        zip: 80206
      )
      shelter_2 = Shelter.create!(
        name: 'Mountain Shelter',
        address: '1234 West 12th',
        city: 'Denver',
        state: 'Colorado',
        zip: 80204
      )

      visit "/shelters/#{shelter_1.id}/pets"

      click_link 'Create Pet'

      expect(current_path).to eq("/shelters/#{shelter_1.id}/pets/new")

      fill_in :image, with: 'https://gardenandgun.com/wp-content/uploads/2018/04/cash.jpg'
      fill_in :name, with: ''
      fill_in :description, with: 'Old pup'
      fill_in :age, with: 10
      fill_in :sex, with: 'Male'

      click_on 'Create Pet'

      expect(page).to have_content("Name can't be blank")
    end

    it 'can create a new pet' do
      shelter_1 = Shelter.create(
        name: "John's Shelter",
        address: '1550 East 15th',
        city: 'Denver',
        state: 'Colorado',
        zip: 80206
      )
      shelter_2 = Shelter.create!(
        name: 'Mountain Shelter',
        address: '1234 West 12th',
        city: 'Denver',
        state: 'Colorado',
        zip: 80204
      )

      visit "/shelters/#{shelter_1.id}/pets"

      click_link 'Create Pet'

      expect(current_path).to eq("/shelters/#{shelter_1.id}/pets/new")

      fill_in :image, with: 'https://farm4.static.flickr.com/3152/2968029688_11d619df47.jpg'
      fill_in :name, with: 'Oliver'
      fill_in :description, with: 'Dark brown'
      fill_in :age, with: 0
      fill_in :sex, with: 'Male'

      click_on 'Create Pet'

      expect(current_path).to eq("/shelters/#{shelter_1.id}/pets")
    end
  end
end
