require 'rails_helper'

RSpec.describe 'As a visitor', type: :feature do
  describe 'when I visit the new shelter form by clicking on the link in the index' do
    it 'can create a new shelter' do
      visit '/shelters'
      click_link 'New Shelter'

      expect(current_path).to eq('/shelters/new')
      expect(page).to have_content('Create New Shelter')

      fill_in :name, with: 'Denver Dog Shelter'
      fill_in :address, with: '1530 S. High St.'
      fill_in :city, with: 'Denver'
      fill_in :state, with: 'Colorado'
      fill_in :zip, with: '80210'

      click_on 'Create Shelter'

      expect(current_path).to eq('/shelters')
      expect(page).to have_content('Denver Dog Shelter')
    end

    it 'cannot create a new shelter with missing info' do
      visit '/shelters'
      click_link 'New Shelter'

      expect(current_path).to eq('/shelters/new')
      expect(page).to have_content('Create New Shelter')

      fill_in :name, with: 'Dog Shelter'
      fill_in :address, with: '1530 S. High St.'
      fill_in :state, with: 'Colorado'
      fill_in :zip, with: '80210'

      click_on 'Create Shelter'

      expect(current_path).to eq('/shelters/new')
      expect(page).to have_content("City can't be blank") 
    end
  end
end
