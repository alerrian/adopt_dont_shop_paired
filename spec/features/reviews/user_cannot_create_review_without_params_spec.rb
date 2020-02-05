require 'rails_helper'

RSpec.describe 'as a visitor', type: :feature do
  describe 'when I visit a shelter show page' do
    before :each do
      @shelter_1 = Shelter.create!(
        name: "John's Shelter",
        address: '1550 East 15th',
        city: 'Denver',
        state: 'Colorado',
        zip: 80206
      )
    end

    it 'cannot create a review without certain params' do
      visit "/shelters/#{@shelter_1.id}/reviews/new"

      click_on 'Submit Review'

      expect(page).to have_content("Review not submitted: Required information missing.")
      expect(page).to have_button('Submit Review')
    end
  end
end
