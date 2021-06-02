class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :search]
  def home
  end

  def search
    @cakes = Cake.all
    if params[:search]["search"].blank?
      render :home
    else
      # @parameter = params[:search]
      @results = Cake.where("name ILIKE ?", "%#{params[:search]["search"]}%")
    end
  end
end
