class AdoptionsController < ApplicationController
  def new
    @favorite_pets = Pet.find(session[:favorites].keys)
  end
end
