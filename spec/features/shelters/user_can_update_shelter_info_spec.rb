require 'rails_helper'

RSpec.describe 'As a visitor', type: :feature do
  describe 'when I visit the single shelter page by clicking on the shelter link' do
    it 'can update a shelter' do
      shelter_1 = Shelter.create!(name: "John's Shelter",
                                address: "1550 East 15th",
                                city: "Denver",
                                state: "Colorado",
                                zip: 80206
                              )

      visit "/shelters/#{shelter_1.id}"
      click_link 'Update Shelter'

      expect(current_path).to eq("/shelters/#{shelter_1.id}/edit")
      expect(page).to have_content("Update Shelter")

      fill_in :state, with: 'Colorado'
      fill_in :zip, with: '80210'

      click_on 'Update Shelter'

      expect(page).to have_content("80210")
      # expect(current_path).to eq('/shelters')
      # expect(page).to have_content('Denver Dog Shelter')
    end
  end
end

# [ ] done
#
# User Story 5, Shelter Update
#
# As a visitor
# When I visit a shelter show page
# Then I see a link to update the shelter "Update Shelter"
# When I click the link "Update Shelter"
# Then I am taken to '/shelters/:id/edit' where I  see a form to edit the shelter's data including:
# - name
# - address
# - city
# - state
# - zip
# When I fill out the form with updated information
# And I click the button to submit the form
# Then a `PATCH` request is sent to '/shelters/:id',
# the shelter's info is updated,
# and I am redirected to the Shelter's Show page where I see the shelter's updated info
