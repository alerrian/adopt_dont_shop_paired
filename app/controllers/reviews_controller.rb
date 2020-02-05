class ReviewsController < ApplicationController
  def index
    @reviews = Review.all
  end

  def new
    @shelter_id = params[:shelter_id]
  end

  def create
    @shelter_id = params[:shelter_id]
    review = Review.new(review_params)
    if review.save
      redirect_to "/shelters/#{review.shelter_id}"
    else
      flash[:notice] = "Review not submitted: Required information missing."
      render :new
    end
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
