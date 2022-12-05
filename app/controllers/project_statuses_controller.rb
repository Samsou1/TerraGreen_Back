class ProjectStatusesController < ApplicationController
  before_action :set_project_status, only: %i[ show update destroy ]

  # GET /project_statuses
  def index
    @project_statuses = ProjectStatus.all

    render json: @project_statuses
  end

  # GET /project_statuses/1
  def show
    render json: @project_status
  end

  # POST /project_statuses
  def create
    @project_status = ProjectStatus.new(project_status_params)

    if @project_status.save
      render json: @project_status, status: :created, location: @project_status
    else
      render json: @project_status.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /project_statuses/1
  def update
    if @project_status.update(project_status_params)
      render json: @project_status
    else
      render json: @project_status.errors, status: :unprocessable_entity
    end
  end

  # DELETE /project_statuses/1
  def destroy
    @project_status.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project_status
      @project_status = ProjectStatus.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def project_status_params
      params.require(:project_status).permit(:name)
    end
end
