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
  end
end
