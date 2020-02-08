require 'rails_helper'

RSpec.describe 'As a visitor when I favorite a pet' do
  before :each do
    before :each do
      @shelter_1 = Shelter.create!(
        name: "John's Shelter",
        address: '1550 East 15th',
        city: 'Denver',
        state: 'Colorado',
        zip: 80206
      )
      @pet1 = Pet.create(
        image: 'https://gardenandgun.com/wp-content/uploads/2018/04/cash.jpg',
        name: 'Nala',
        description: 'Black lab',
        age: '2',
        sex: 'female',
        adoptable: 'yes',
        shelter_id: @shelter_1.id
      )
    end

    it "can't favorite a pet more than once" do
      visit "/pets/#{@pet1.id}"

    expect(current_path).to eq("/pets/#{@pet1.id}")
    click_on 'Add Favorite'

    expect(page).to have_content("Favorites: 1")
    expect(page).not_to have_button('Favorite')
     expect(page).to have_content('Unfavorite Pet')
  end

  it "can delete the pet from favorites list" do
    visit "/pets/#{@pet1.id}"

    expect(current_path).to eq("/pets/#{@pet1.id}")
    click_on 'Add Favorite'
    expect(page).to have_content("Favorites: 1")
    expect(page).not_to have_button('Favorite')
    click_on 'Unfavorite Pet'
    save_and_open_page
    expect(page).to have_content('Unfavorite Pet')
    expect(current_path).to eq("/favorites")
    expect(page).not_to have_content("#{@pet1.name}")
  end
  end
end
