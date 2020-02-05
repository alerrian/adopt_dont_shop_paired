require 'rails_helper'

RSpec.describe 'As a visitor', type: :feature do
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
      image: '',
      shelter_id: @shelter_1.id
    )
  end

  it 'can delete a review' do
    visit "/shelters/#{@shelter_1.id}"

    click_on 'Delete Review'

    expect(current_path).to eq("/shelters/#{@shelter_1.id}")
    expect(page).not_to have_content(@review_1.title)
  end
end
