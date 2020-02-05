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

    @review1 = Review.create(
      title: 'New review',
      rating: '5',
      content: 'This place is awesome!',
      image: '',
      shelter_id: @shelter1.id
    )
  end

  it 'can see all reviews for a shelter' do
    visit "/shelters/#{@shelter1.id}"

    expect(page).to have_content(@review1.title)
    expect(page).to have_content(@review1.rating)
    expect(page).to have_content(@review1.content)
  end
end
