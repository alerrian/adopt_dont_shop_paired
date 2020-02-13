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
    pet = Pet.new(pet_params)
    pet.save
    redirect_to "/shelters/#{pet.shelter_id}/pets"
  end

  def edit
    @pet = Pet.find(params[:id])
  end

  def update
    pet = Pet.find(params[:id])
    pet.update(
      image: params[:image],
      name: params[:name],
      description: params[:description],
      age: params[:age],
      sex: params[:sex]
    )

    pet.save

    redirect_to "/pets/#{pet.id}"
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
