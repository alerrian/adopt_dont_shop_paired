class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :favorite, :in_favs?
  before_action :favorite, :in_favs?

  def favorite
    @favorites ||= Favorite.new(session[:favorites])
  end

  def in_favs?
    if session[:favorites]
      session[:favorites].include?(params[:id].to_s)
    end
  end
end
