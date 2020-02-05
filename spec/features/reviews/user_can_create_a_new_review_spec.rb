require 'rails_helper'

RSpec.describe 'as a visitor', type: :feature do
  before :each do
    @shelter1 = Shelter.create(
      name: "John's Shelter",
      address: '1550 East 15th',
      city: 'Denver',
      state: 'Colorado',
      zip: 80206
    )

    @review1 = Review.create!(
      title: 'New review',
      rating: '5 Stars',
      content: 'This place is awesome!',
      image: 'no image',
      shelter_id: @shelter1.id
    )
  end

  it 'can create a new review' do
    visit "/shelters/#{@shelter1.id}"

    click_on 'New Review'

    expect(current_path).to eq("/shelters/#{@shelter1.id}/reviews/new")

    fill_in :title, with: 'Best place for pets'
    fill_in :rating, with: '5 stars'
    fill_in :content, with: 'This is the best shelter in Denver!'
    fill_in :image, with: 'No image'

    click_on 'Submit Review'

    expect(current_path).to eq("/shelters/#{@shelter1.id}")
    expect(page).to have_content('Best place for pets')
    expect(page).to have_content('This is the best shelter in Denver!')
  end
end
