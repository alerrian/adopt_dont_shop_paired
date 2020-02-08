class FavoritesController < ApplicationController
  def index
    if session[:favorites]
      @favs = Pet.find(session[:favorites].keys)
    else
      {}
    end
  end

  def update
    # require "pry"; binding.pry
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
    # require "pry"; binding.pry
    # session[:favorites].delete(params[:id])
    flash[:success] = "Pet Removed from Favorites"
    redirect_back(fallback_location: '/favorites')
  end
end
