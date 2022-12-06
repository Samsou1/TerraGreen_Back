class ProjectsController < ApplicationController
  before_action :set_project, only: %i[ show update destroy ]
  before_action :authenticate_user!, only: %i[create update destroy]

  # GET /projects
  def index
    if params[:search_term]
      if params[:search_term] == 'user'
        @projects = Project.where(user_id: current_user.id)
      else
        @projects = Project.where('lower(city) LIKE :prefix', prefix: "#{params[:search_term].downcase}%")
      end
    else
      @projects = Project.all
    end

    render json: @projects
  end

  # GET /projects/1
  def show
    render json: @project
  end

  # POST /projects
  def create
    @project = Project.new(project_params)
    @project.country_id = Country.find_by(name: params[:project][:country]).id
    @project.region_id = Region.find_by(name: params[:project][:region]).id
    @project.project_status_id = ProjectStatus.find_by(name: params[:project][:project_status]).id
    @project.user_id = current_user.id
    if @project.save
      render json: @project, status: :created, location: @project
    else
      render json: @project.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /projects/1
  def update
    if @project.user_id == current_user.id || current_user.admin 
      if @project.update(project_params)
        render json: @project
      else
        render json: @project.errors, status: :unprocessable_entity
      end
    else
      render json: { message: 'You are not the creator of this project.'}, status: :unprocessable_entity
    end
  end

  # DELETE /projects/1
  def destroy
    @project.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def project_params
      params.require(:project).permit(:title, :content, :project_status_id, :date, :address, :city, :postal_code, :GPS, :region_id, :country_id)
    end
end
