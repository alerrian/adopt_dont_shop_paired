class Shelter < ApplicationRecord
  validates_presence_of :name, :address, :city, :state, :zip
  has_many :pets, dependent: :destroy
  has_many :reviews, dependent: :destroy

  def pet_count
    pets.count
  end

  def average_rating
    sum = 0
    reviews.each { |review| sum += review.rating.to_i }

    return 0 if reviews.count == 0

    sum / reviews.count
  end

  def app_count
    pets.joins(:adoptions).count
  end
end
