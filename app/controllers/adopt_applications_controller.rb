class AdoptApplicationsController < ApplicationController
  def index

  end

  def new
  end

  def create
    # require "pry"; binding.pry
    app = AdoptApplication.new({
          # pet: params[:pet],
          name: params[:name],
          address: params[:address],
          city: params[:city],
          state: params[:state],
          zip: params[:zip],
          phone_number: params[:phone_number],
          description: params[:description]
        })

      if app.save
        require "pry"; binding.pry
        flash[:success] = 'Application submitted, thank you!'
        redirect_to '/favorites'
      else
        flash[:error] = 'Application not submitted. Please complete the required fields.'
      redirect_to '/applications/new'
    end
  end

  private

    def application_params
      params.permit(
        :name,
        :address,
        :city,
        :state,
        :zip,
        :phone_number,
        :description
      )
    end
end
