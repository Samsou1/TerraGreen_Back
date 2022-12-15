class RegionsController < ApplicationController
  before_action :set_region, only: %i[ show update destroy ]
  before_action :authenticate_user!, only: %i[create update destroy]

  # GET /regions
  def index
    if params[:search_term]
      country_id = Country.find(params[:search_term].to_i).id
      @regions = Region.where(country_id: country_id)
    else
      @regions = Region.all
    end

    render json: @regions
  end

  # GET /regions/1
  def show
    render json: @region
  end

  # POST /regions
  def create
    @region = Region.new(region_params)

    if current_user.admin && @region.save
      render json: @region, status: :created, location: @region
    else
      render json: @region.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /regions/1
  def update
    if current_user.admin && @region.update(region_params)
      render json: @region
    else
      render json: @region.errors, status: :unprocessable_entity
    end
  end

  # DELETE /regions/1
  def destroy
    if current_user.admin
      @region.destroy
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_region
      @region = Region.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def region_params
      params.require(:region).permit(:name, :country_id)
    end
end
