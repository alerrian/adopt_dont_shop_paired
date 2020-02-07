require 'rails_helper'

RSpec.describe "When a user adds pet to their favorites" do
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

  it "can favorite a pet" do
    visit "/pets"

    within "#pet-#{@pet1.id}" do
      click_on "Add Favorite"
    end

     expect(page).to have_content("Favorites: 1")

     expect(page).to have_content("You have added #{@pet1.name} to your favorites.")
   end

   it 'cannot add more than one of a pet' do
     visit '/pets'

     within "#pet-#{@pet1.id}" do
       click_on "Add Favorite"
     end

     expect(page).to have_content('Unfavorite Pet')
     expect(page).to have_content("Favorites: 1")
   end
end
