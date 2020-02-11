class AdoptionsController < ApplicationController
  def new
    # require "pry"; binding.pry
    @favorite_pets = Pet.find(session[:favorites].keys)
  end

  def index
    # require "pry"; binding.pry
    @adoptions = Adoption.all
    @pet = Pet.find(params[:id])

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
      redirect_to '/adoptions/new'
    end
  end

  def show
    # if params[:adoption_id]
      @adoption = Adoption.find(params[:id])
    # else
    #   @pet = Pet.find(params[:pet_id])
    # end
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
