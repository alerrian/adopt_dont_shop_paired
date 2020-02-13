class PetsController < ApplicationController
  def index
    if params[:shelter_id]
      @shelter = Shelter.find(params[:shelter_id])
      @pets = @shelter.pets
    else
      @pets = Pet.all
      @favorite = Favorite.new(session[:favorites])
    end
  end

  def show
    @pet = Pet.find(params[:id])
  end

  def new
    @shelter_id = params[:shelter_id]
  end

  def create
    pet = Pet.create(pet_params)
    if pet.save
      redirect_to "/shelters/#{pet.shelter_id}/pets"
    else
      flash[:error] = pet.errors.full_messages.to_sentence
      redirect_to "/shelters/#{pet.shelter_id}/pets/new"
    end
  end

  def edit
    @pet = Pet.find(params[:id])
  end

  def update
    pet = Pet.find(params[:id])
    if pet.update(pet_params)
      redirect_to "/pets/#{pet.id}"
    else
      flash[:error] = pet.errors.full_messages.to_sentence
      redirect_to "/pets/#{pet.id}/edit"
    end
  end

  def destroy
    pet = Pet.find(params[:id])

    if pet.adoptable.include?('Pending')
      flash[:notice] = 'You cannot delete this pet.'
      redirect_to "/pets/#{pet.id}"
    else
      apps = PetAdoption.where(pet_id: pet.id)
      PetAdoption.destroy(apps.ids)
      Pet.destroy(pet.id)
      @favorites.delete_pet(pet.id)
      redirect_to '/pets'
    end
  end

  private

  def pet_params
    params.permit(
      :image,
      :name,
      :description,
      :age,
      :sex,
      :adoptable,
      :shelter_id
    )
  end
end
