class ProjectRegistrationsController < ApplicationController
  before_action :set_project_registration, only: %i[ show update destroy ]

  # GET /project_registrations
  def index
    @project_registrations = ProjectRegistration.all

    render json: @project_registrations
  end

  # GET /project_registrations/1
  def show
    render json: @project_registration
  end

  # POST /project_registrations
  def create
    @project_registration = ProjectRegistration.new(project_registration_params)

    if @project_registration.save
      render json: @project_registration, status: :created, location: @project_registration
    else
      render json: @project_registration.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /project_registrations/1
  def update
    if @project_registration.update(project_registration_params)
      render json: @project_registration
    else
      render json: @project_registration.errors, status: :unprocessable_entity
    end
  end

  # DELETE /project_registrations/1
  def destroy
    @project_registration.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project_registration
      @project_registration = ProjectRegistration.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def project_registration_params
      params.require(:project_registration).permit(:user_id, :project_id)
    end
end
