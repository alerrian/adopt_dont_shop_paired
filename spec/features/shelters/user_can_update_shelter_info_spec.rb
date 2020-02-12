require 'rails_helper'

RSpec.describe 'As a visitor', type: :feature do
  describe 'when I visit the single shelter page by clicking on the shelter link' do
    it 'can update a shelter' do
      shelter_1 = Shelter.create!(
        name: "John's Shelter",
        address: '1550 East 15th',
        city: 'Denver',
        state: 'Colorado',
        zip: 80206
      )

      visit "/shelters/#{shelter_1.id}"
      click_link 'Update Shelter'

      expect(current_path).to eq("/shelters/#{shelter_1.id}/edit")
      expect(page).to have_content('Update Shelter')

      fill_in :state, with: 'Colorado'
      fill_in :zip, with: '80210'

      click_on 'Update Shelter'

      expect(page).to have_content('80210')
    end

    it 'cannot update a shelter missing info' do
      shelter_1 = Shelter.create!(
        name: "John's Shelter",
        address: '1550 East 15th',
        city: 'Denver',
        state: 'Colorado',
        zip: 80206
      )

      visit "/shelters/#{shelter_1.id}"
      click_link 'Update Shelter'

      expect(current_path).to eq("/shelters/#{shelter_1.id}/edit")
      expect(page).to have_content('Update Shelter')

      fill_in :state, with: 'Colorado'
      fill_in :zip, with: '80210'
      fill_in :name, with: ''

      click_on 'Update Shelter'

      expect(current_path).to eq("/shelters/#{shelter_1.id}/edit")
      expect(page).to have_content("Name can't be blank")
    end
  end
end
