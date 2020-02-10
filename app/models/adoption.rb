class Adoption < ApplicationRecord
  validates_presence_of :name,
                        :address,
                        :city,
                        :state,
                        :zip,
                        :phone_number,
                        :description

  has_many :pet_adoptions
  has_many :pets, through: :pet_adoptions
end
