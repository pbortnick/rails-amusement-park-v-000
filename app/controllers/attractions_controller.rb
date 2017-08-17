class AttractionsController < ApplicationController

  before_action :current_user, except: [:create, :update]
  before_action :set_attraction, only: [:show, :edit, :update]

  def new
    @attraction = Attraction.new
  end

  def create
    @attraction = Attraction.create(attraction_params)
    redirect_to attraction_path(@attraction)
  end

  def index
    @attractions = Attraction.all
  end

  def show
    @user = @current_user
  end

  def edit

  end

  def update
    @attraction.update(attraction_params)
    redirect_to attraction_path(@attraction)
  end

  private

  def attraction_params
    params.require(:attraction).permit(:name,:min_height,:nausea_rating,:happiness_rating,:tickets)
  end

  def set_attraction
    @attraction = Attraction.find_by(id: params[:id])
  end

end
