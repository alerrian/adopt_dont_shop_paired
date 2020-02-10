class FavoritesController < ApplicationController
  def index
    pet_adopt = PetAdoption.all
    @apps = []

    if @apps
      pet_adopt.each do |pet|
        @apps.push(pet)
      end
    end

    if session[:favorites]
      @favs = Pet.find(session[:favorites].keys)
    else
      {}
    end
  end

  def update
    pet = Pet.find(params[:pet_id])
    pet_id_str = pet.id.to_s
    session[:favorites] ||= Hash.new(0)
    session[:favorites][pet_id_str] ||= 0
    session[:favorites][pet_id_str] = 1
    flash[:notice] = "You have added #{pet.name} to your favorites."
    redirect_to "/pets/#{pet.id}"
  end

  def destroy
    pet = Pet.find(params[:pet_id])
    session[:favorites].delete(pet.id.to_s)
    flash[:success] = "Pet Removed from Favorites"
    redirect_to "/pets/#{pet.id}"
  end

  def destroy_all
    session[:favorites] = {}
    redirect_to '/favorites'
  end
end
