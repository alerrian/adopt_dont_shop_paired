class FavoritesController < ApplicationController
  def index
    if session[:favorites]
      @favs = Pet.find(session[:favorites].keys)
    end
  end

  def update
    pet = Pet.find(params[:pet_id])
    pet_id_str = pet.id.to_s
    session[:favorites] ||= Hash.new(0)
    session[:favorites][pet_id_str] ||= 0
    session[:favorites][pet_id_str] += 1
    quantity = session[:favorites][pet_id_str]
    flash[:notice] = "You have added #{pet.name} to your favorites."
    redirect_to "/pets/#{pet.id}"
  end
end
