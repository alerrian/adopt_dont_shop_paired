class PetAdoptionsController < ApplicationController
  def update
    pet_adoption = PetAdoption.find_by(
      adoption_id: params[:adoptions_id],
      pet_id: params[:pet_id]
    )

    if pet_adoption.pet.adoptable == 'Adoptable'
      pet_adoption.pet.adoptable = "Pending adoption for #{pet_adoption.adoption.name}"
      pet_adoption.pet.save
      redirect_to "/pets/#{pet_adoption.pet.id}"
    else
      flash[:notice] = 'Pet already pending for adoption'
    end
  end
end
