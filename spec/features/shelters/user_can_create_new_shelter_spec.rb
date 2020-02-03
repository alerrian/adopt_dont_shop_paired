require 'rails_helper'

RSpec.describe 'As a visitor', type: :feature do
  describe 'when I visit the new shelter form by clicking on the link in the index' do
    it 'can create a new shelter' do

      visit '/shelters'
      click_link 'New Shelter'

      expect(current_path).to eq('/shelters/new')
      expect(page).to have_content("Create New Shelter")

      fill_in :name, with: 'Denver Dog Shelter'
      fill_in :address, with: '1530 S. High St.'
      fill_in :city, with: 'Denver'
      fill_in :state, with: 'Colorado'
      fill_in :zip, with: '80210'

      click_on 'Create Shelter'

      expect(current_path).to eq('/shelters')
      expect(page).to have_content('Denver Dog Shelter')
    end
  end
end



# [ ] done
#
# User Story 4, Shelter Creation
#

# Then I am taken to '/shelters/new' where I  see a form for a new shelter
# When I fill out the form with a new shelter's:
# - name
# - address
# - city
# - state
# - zip
# And I click the button "Create Shelter" to submit the form
# Then a `POST` request is sent to '/shelters',
# a new shelter is created,
# and I am redirected to the Shelter Index page where I see the new Shelter listed.
