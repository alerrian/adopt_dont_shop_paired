require 'rails_helper'

RSpec.describe 'As a visitor', type: :feature do
  describe 'when I visit application show page' do
    before :each do
      @shelter_1 = Shelter.create!(
        name: "John's Shelter",
        address: '1550 East 15th',
        city: 'Denver',
        state: 'Colorado',
        zip: 80206
      )
      @pet1 = Pet.create!(
        image: 'https://gardenandgun.com/wp-content/uploads/2018/04/cash.jpg',
        name: 'Nala',
        description: 'Black lab',
        age: '2',
        sex: 'female',
        adoptable: 'Adoptable',
        shelter_id: @shelter_1.id
      )
      @pet2 = Pet.create(
        image: 'https://huhinteresting.files.wordpress.com/2009/07/buddy31.jpg',
        name: 'Leo',
        description: 'Big dog',
        age: '4',
        sex: 'male',
        adoptable: 'Adoptable',
        shelter_id: @shelter_1.id
      )
      @adoption1 = Adoption.create!(
        name: "Steve",
        address:'1234 S. North Street Road',
        city:'The Place I feel Safest',
        state:'CO',
        zip:'06111',
        phone_number: '719-123-4567',
        description:'I love this animal so much! I would be great.'
      )
      PetAdoption.create!(pet_id: @pet1.id, adoption_id: @adoption1.id)
      PetAdoption.create!(pet_id: @pet2.id, adoption_id: @adoption1.id)
    end

    it 'can approve pets for the application on show page' do
      visit "/adoptions/#{@adoption1.id}"

      click_on "Approve Application for #{@pet1.name}"

      expect(current_path).to eq("/pets/#{@pet1.id}")

      expect(page).to have_content("Status: Pending adoption for #{@adoption1.name}")
    end

    it 'can approve a second pet on an adoption page' do
      visit "/adoptions/#{@adoption1.id}"

      click_on "Approve Application for #{@pet2.name}"

      expect(current_path).to eq("/pets/#{@pet2.id}")

      expect(page).to have_content("Status: Pending adoption for #{@adoption1.name}")
    end

    it 'cannot approve pet more than once' do
      visit "/adoptions/#{@adoption1.id}"

      click_on "Approve Application for #{@pet1.name}"

      expect(current_path).to eq("/pets/#{@pet1.id}")

      visit "/adoptions/#{@adoption1.id}"

      click_on "Approve Application for #{@pet1.name}"

      expect(current_path).to eq("/adoptions/#{@adoption1.id}")
      expect(page).to have_content('Cannot approve application: Pet already pending for adoption') 
    end
  end
end
