require 'rails_helper'

RSpec.describe Shelter, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :address }
    it { should validate_presence_of :city }
    it { should validate_presence_of :state }
    it { should validate_presence_of :zip }
  end

  describe 'relationships' do
    it { should have_many :pets }
    it { should have_many :reviews }
  end

  describe 'methods ' do
    it 'pet count' do
      shelter_1 = Shelter.create(
        name: "John's Shelter",
        address: '1550 East 15th',
        city: 'Denver',
        state: 'Colorado',
        zip: 80206
      )

      shelter_2 = Shelter.create(
        name: "Mikes's Shelter",
        address: '12 East 15th',
        city: 'Aroura',
        state: 'Colorado',
        zip: 80206
      )

      pet1 = Pet.create(
        image: 'https://gardenandgun.com/wp-content/uploads/2018/04/cash.jpg',
        name: 'Nala',
        description: 'Black lab',
        age: '2',
        sex: 'female',
        adoptable: 'yes',
        shelter_id: shelter_1.id
      )
      expect(shelter_1.pet_count).to eq(1)
      expect(shelter_2.pet_count).to eq(0)
    end

    it 'average_rating' do

      shelter_1 = Shelter.create(
        name: "John's Shelter",
        address: '1550 East 15th',
        city: 'Denver',
        state: 'Colorado',
        zip: 80206
      )

      shelter_2 = Shelter.create(
        name: "Mikes's Shelter",
        address: '12 East 15th',
        city: 'Aroura',
        state: 'Colorado',
        zip: 80206
      )

      pet1 = Pet.create(
        image: 'https://gardenandgun.com/wp-content/uploads/2018/04/cash.jpg',
        name: 'Nala',
        description: 'Black lab',
        age: '2',
        sex: 'female',
        adoptable: 'yes',
        shelter_id: shelter_1.id
      )

      review_1 = Review.create!(
        title: 'Shelter 1 review',
        rating: '5',
        content: 'This is the best shelter I have ever seen. Ever.',
        image: '',
        shelter_id: shelter_1.id
      )

      review_2 = Review.create!(
        title: 'Shelter review',
        rating: '3',
        content: 'This is the best shelter I have ever seen. Ever.',
        image: '',
        shelter_id: shelter_1.id
      )

      expect(shelter_1.average_rating).to eq(4)
      expect(shelter_2.average_rating).to eq(0)
    end

    it 'app_count' do

      shelter_1 = Shelter.create(
        name: "John's Shelter",
        address: '1550 East 15th',
        city: 'Denver',
        state: 'Colorado',
        zip: 80206
      )

      shelter_2 = Shelter.create(
        name: "Mikes's Shelter",
        address: '12 East 15th',
        city: 'Aroura',
        state: 'Colorado',
        zip: 80206
      )

      pet1 = Pet.create(
        image: 'https://gardenandgun.com/wp-content/uploads/2018/04/cash.jpg',
        name: 'Nala',
        description: 'Black lab',
        age: '2',
        sex: 'female',
        adoptable: 'yes',
        shelter_id: shelter_1.id
      )

      pet2 = Pet.create(
        image: 'https://huhinteresting.files.wordpress.com/2009/07/buddy31.jpg',
        name: 'Leo',
        description: 'Big dog',
        age: '4',
        sex: 'male',
        adoptable: 'yes',
        shelter_id: shelter_1.id
      )

      application1 = Adoption.create(
        name: "Steve",
        address:'1234 S. North Street Road',
        city:'The Place I feel Safest',
        state:'CO',
        zip:'06111',
        phone_number: '719-123-4567',
        description:'I love this animal so much! I would be great.'
      )

      application2 = Adoption.create(
        name: "Mike",
        address:'5 S. North Street Road',
        city:'The Place I feel Worst',
        state:'CO',
        zip:'06111',
        phone_number: '719-123-4567',
        description:'I love this animal so much! I would be great.'
      )
       PetAdoption.create!(pet_id: pet1.id, adoption_id: application1.id)
       PetAdoption.create!(pet_id: pet1.id, adoption_id: application2.id)

      expect(shelter_1.app_count).to eq(2)
    end
  end
end
