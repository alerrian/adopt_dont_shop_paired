require 'rails_helper'

RSpec.describe "When I vist the favorites index page " do
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

    @pet2 = Pet.create(
      image: 'https://huhinteresting.files.wordpress.com/2009/07/buddy31.jpg',
      name: 'Leo',
      description: 'Big dog',
      age: '4',
      sex: 'male',
      adoptable: 'yes',
      shelter_id: @shelter_1.id
    )

    visit "/pets/#{@pet1.id}"
    click_on 'Add Favorite'
    visit "/pets/#{@pet2.id}"
    click_on 'Add Favorite'
  end

  it 'has link to a new adopt form' do
    visit '/favorites'
    expect(page).to have_link("Adoption Application")
end
  it 'when I click on the adopt app link I go to new app form' do
    visit '/favorites'
    click_on 'Adoption Application'
    expect(current_path).to eq("/adopt_applications/new")
end
  it 'when I click on the adopt app link I go to new app form' do
    visit '/favorites'
    click_on 'Adoption Application'
    expect(current_path).to eq("/adopt_applications/new")
      fill_in :pet, with: "#{@pet2.id}"
      fill_in :name, with: 'Robert'
      fill_in :address, with: '700 Penn St.'
      fill_in :city, with: 'Denver'
      fill_in :state, with: 'Colorado'
      fill_in :zip, with: 80210
      fill_in :phone_number, with: '663-273-1142'
      fill_in :description, with: 'I love dogs!'

  click_on 'Submit Application'
  expect(current_path).to eq("/favorites")

end

# it 'can see checkboxes for favorite pets' do
#     visit '/adopt_applications/new'
#
#     expect(page).to have_unchecked_field(@pet1.name)
#     expect(page).to have_unchecked_field(@pet2.name)
#   end

end

# As a visitor
# When I have added pets to my favorites list
# And I visit my favorites page ("/favorites")
# I see a link for adopting my favorited pets
# When I click that link I'm taken to a new application form
# At the top of the form, I can select from the pets of which I've favorited for which I'd like this application to apply towards (can be more than one)
# When I select one or more pets, and fill in my
# - Name
# - Address
# - City
# - State
# - Zip
# - Phone Number
# - Description of why I'd make a good home for this/these pet(s)
# And I click on a button to submit my application
# I see a flash message indicating my application went through for the pets that were selected
# And I'm taken back to my favorites page where I no longer see the pets for which I just applied listed as favorites
