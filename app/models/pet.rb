class Pet < ApplicationRecord
  validates_presence_of :image, :name, :age, :sex, :description, :adoptable
  belongs_to :shelter

  has_many :pet_adoptions
  has_many :adoptions, through: :pet_adoptions
end
