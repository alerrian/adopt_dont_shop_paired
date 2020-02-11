class PetAdoptionsController < ApplicationController
  def create
    PetAdoptionsController.create!(pet_adoptions_params)
    redirect_to "/adoptions/#{params[:adoption_id]}"
  end

  private

  def pet_adoptions_params
    params.permit(
      :pet_id,
      :adoption_id
    )
  end
end
