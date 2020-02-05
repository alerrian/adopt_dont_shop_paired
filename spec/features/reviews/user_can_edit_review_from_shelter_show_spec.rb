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

      @review_1 = Review.create!(
        title: 'Shelter 1 review',
        rating: '5',
        content: 'This is the best shelter I have ever seen. Ever.',
        image: 'There is no image here',
        shelter_id: @shelter_1.id
      )
    end

    it 'can edit a review' do
      visit "/shelters/#{@shelter_1.id}"

      click_on 'Edit Review'

      expect(current_path).to eq("/shelters/#{@shelter_1.id}/reviews/#{@review_1.id}/edit")
      expect(page).to have_field('title', with: @review_1.title)
      expect(page).to have_field('rating', with: @review_1.rating)
      expect(page).to have_field('content', with: @review_1.content)
      expect(page).to have_field('image', with: @review_1.image)

      fill_in :title, with: 'New Rating Edited'
      select '3', from: :rating
      fill_in :content, with: 'This is the best shelter in Denver!'
      fill_in :image, with: 'No image'

      click_on 'Submit'

      expect(current_path).to eq("/shelters/#{@shelter_1.id}")
      expect(page).to have_content('New Rating Edit')
    end

    it 'cannot edit a review while missing input' do
      visit "/shelters/#{@shelter_1.id}"

      click_on 'Edit Review'

      expect(current_path).to eq("/shelters/#{@shelter_1.id}/reviews/#{@review_1.id}/edit")
      expect(page).to have_field('title', with: @review_1.title)
      expect(page).to have_field('rating', with: @review_1.rating)
      expect(page).to have_field('content', with: @review_1.content)
      expect(page).to have_field('image', with: @review_1.image)

      fill_in :title, with: ''
      select '3', from: :rating
      fill_in :content, with: 'This is the best shelter in Denver!'
      fill_in :image, with: 'No image'

      click_on 'Submit'

      expect(current_path).to eq("/shelters/#{@shelter_1.id}/reviews/#{@review_1.id}")
      expect(page).to have_content("Review not submitted: Required information missing.")
    end
  end
end
