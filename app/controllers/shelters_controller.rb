class SheltersController < ApplicationController
  def index
    @shelters = Shelter.all
  end

  def new
  end

  def create
    shelter = Shelter.new(shelter_params)
    if shelter.save
      redirect_to '/shelters'
    else
      flash[:error] = shelter.errors.full_messages.to_sentence
      redirect_to '/shelters/new'
    end
  end

  def show
    @shelter = Shelter.find(params[:id])
  end

  def update
    shelter = Shelter.find(params[:id])
    shelter.update(shelter_params)
    if shelter.save
      redirect_to "/shelters/#{shelter.id}"
    else
      flash[:error] = shelter.errors.full_messages.to_sentence
      redirect_to "/shelters/#{shelter.id}/edit"
    end
  end

  def edit
    @shelter = Shelter.find(params[:id])
  end

  def destroy
    shelter = Shelter.find(params[:id])
    if shelter.pets.any? { |pet| pet.adoptable.include?('Pending')}
      flash[:notice] = 'You cannot delete this shelter.'
      redirect_to "/shelters/#{shelter.id}"
    else
      shelter.pets.destroy_all
      shelter.reviews.destroy_all
      Shelter.destroy(params[:id])
      redirect_to '/shelters'
      flash[:notice] = "#{shelter.name} was deleted."
    end
  end

  private

  def shelter_params
    params.permit(
      :name,
      :address,
      :city,
      :state,
      :zip
    )
  end
end
