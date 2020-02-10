class AdoptionsController < ApplicationController
  def new
    @favorite_pets = Pet.find(session[:favorites].keys)
  end

  def create
    adoption = Adoption.create(adoption_params)

    if adoption.save
      pet_ids = params[:adopted_pet]
      pets = Pet.find(pet_ids)
      adoption.pets.push(pets)

      adoption.pets.each do |pet|
        @favorites.contents.delete(pet.id.to_s)
      end

      redirect_to '/favorites'
      flash[:success] = 'Application submitted successfully!'
    else
      flash[:error] = 'Application not submitted. Please complete the required fields.'
      redirect_to '/applications/new'
    end
  end

  private

  def adoption_params
    params.permit(
      :name,
      :address,
      :city,
      :state,
      :zip,
      :phone_number,
      :description
    )
  end
end
