require 'rails_helper'

RSpec.describe 'as a visitor', type: :feature do
  it 'can see review information' do
    shelter_1 = Shelter.create!(
      name: "John's Shelter",
      address: '1550 East 15th',
      city: 'Denver',
      state: 'Colorado',
      zip: 80206
    )

    review_1 = Review.create!(
      title: 'Shelter 1 review',
      rating: '5',
      content: 'This is the best shelter I have ever seen. Ever.',
      image: 'There is no image here'
    )

    visit '/reviews'

    expect(page).to have_content(review_1.title)
    expect(page).to have_content(review_1.rating)
    expect(page).to have_content(review_1.content)
    expect(page).to have_content(review_1.image)
  end
end
