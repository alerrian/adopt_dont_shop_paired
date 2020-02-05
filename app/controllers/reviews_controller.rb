class ReviewsController < ApplicationController
  def index
    @reviews = Review.all
  end

  def new
    @shelter_id = params[:shelter_id]
  end

  def create
    review = Review.new(review_params)
    review.save
    redirect_to "/shelters/#{review.shelter_id}"
  end

  private

  def review_params
    params.permit(
      :title,
      :rating,
      :content,
      :image,
      :shelter_id
    )
  end
end
