class ProjectRegistrationsController < ApplicationController
  before_action :set_project_registration, only: %i[ show update destroy ]
  before_action :authenticate_user!

  # GET /project_registrations
  def index
    @project_registrations = ProjectRegistration.all

    render json: @project_registrations
  end

  # GET /project_registrations/1
  def show
    render json: @project_registration
  end

  def toggle
    if ProjectRegistration.find_by(project_id: params[:project_registration][:project_id], user_id:current_user.id)
      ProjectRegistration.find_by(project_id: params[:project_registration][:project_id], user_id:current_user.id).destroy
      render json: {message: 'Registration destroyed'}, status: :ok
    else
      @project_registration = ProjectRegistration.new(project_registration_params)
      @project_registration.user_id = current_user.id
      if @project_registration.save
        render json: {message: 'Registration created'}, status: :ok
      else
        render json: {message: 'Something went wrong'}, status: :unprocessable_entity
      end
    end
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
