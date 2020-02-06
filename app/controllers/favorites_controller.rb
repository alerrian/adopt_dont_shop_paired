class FavoritesController < ApplicationController

  def update
   pet = Pet.find(params[:id])
   require "pry"; binding.pry
  
   flash[:notice] = "You have added #{pet.name} to your favorites."
   redirect_to "/pets/#{pet.id}"
 end

end
