require 'rails_helper'

RSpec.describe 'update pet page', type: :feature do
  describe 'while visiting  pet show page ' do
    it 'can update a pet' do
      shelter_1 = Shelter.create(name: "John's Shelter",
                                address: "1550 East 15th",
                                city: "Denver",
                                state: "Colorado",
                                zip: 80206
                              )
      shelter_2 = Shelter.create!(name: "Mountain Shelter",
                                address: "1234 West 12th",
                                city: "Denver",
                                state: "Colorado",
                                zip: 80204
                              )

        pet1 = Pet.create(image: "https://gardenandgun.com/wp-content/uploads/2018/04/cash.jpg",
                          name: "Nala",
                          description: "Black lab",
                          age: "2",
                          sex: "female",
                          adoptable: "yes",
                          shelter_id: shelter_1.id
                          )
        pet2 = Pet.create(image: "https://huhinteresting.files.wordpress.com/2009/07/buddy31.jpg",
                          name: "Leo",
                          description: "Big dog",
                          age: "4",
                          sex: "male",
                          adoptable: "yes",
                          shelter_id: shelter_2.id
                          )

    visit "/pets/#{pet1.id}/edit"

    fill_in :image, with: "https://farm4.static.flickr.com/3152/2968029688_11d619df47.jpg"
    fill_in :name, with: "Oliver"
    fill_in :description, with: "Dark brown"
    fill_in :age, with: 0
    fill_in :sex, with: "Male"

    click_on 'Update Pet'

    expect(current_path).to eq("/pets/#{pet1.id}")
    expect(page).to have_content('Oliver')
    expect(page).to have_content('Dark brown')

    end
  end
end
