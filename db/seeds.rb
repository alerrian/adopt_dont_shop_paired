Pet.destroy_all
Shelter.destroy_all

shelter_1 = Shelter.create(name: "John's Shelter", address: "1550 East 15th", city: "Denver", state: "Colorado", zip: 80206)
shelter_2 = Shelter.create(name: "Mountain Shelter", address: "1234 West 12th", city: "Denver", state: "Colorado", zip: 80204)

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

review1 = Review.create(
  title: 'New review',
  rating: '5',
  content: 'This place is awesome!',
  image: 'no image',
  shelter_id: shelter_1.id
)
