class ProjectsController < ApplicationController
  before_action :set_project, only: %i[ show update destroy ]
  # before_action :authenticate_user!, only: %i[create update destroy]

  # GET /projects
  def index
    puts '$' * 50
    puts params
    puts '$' * 50
    if params[:search_term]
      if params[:search_term] == 'user'
        if current_user
          @projects = Project.where(user_id: current_user.id)
        else
          render json:{message: 'You are not logged in'}, status: :unprocessable_entity
          return
        end
      else
        @regions = Region.where('lower(name) LIKE :prefix', prefix: "#{params[:search_term].downcase}%")
        @countries = Country.where('lower(name) LIKE :prefix', prefix: "#{params[:search_term].downcase}%")
        @projects = Project.where('lower(city) LIKE :prefix', prefix: "#{params[:search_term].downcase}%") 
        @countries.each do |country|
          @projects += Project.where(country_id: country.id)
        end
        @regions.each do |region|
          @projects += Project.where(region_id: region.id)
        end
      end
    else
      @projects = Project.all.distinct
    end

   render json: ProjectSerializer.new(@projects).serializable_hash[:data]
  end

  # GET /projects/1
  def show
    render json: {project: @project, country:@project.country.name, region: @project.region.name, status: @project.project_status.name, comments: @project.comments.includes(:user).select('id, content, user, user_id, created_at'), likes: @project.likes.select('id, user_id')}
  end

  # POST /projects
  def create
    @project = Project.new(project_params)
    # @project.country_id =  Country.find_by(name: params[:project][:country]).id
    # @project.region_id = Region.find_by(name: params[:project][:region]).id
    # @project.user_id = current_user.id
    if @project.save
      render json: @project, status: :created, location: @project
    else
      render json: @project.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /projects/1
  def update
    if @project.user_id == current_user.id || current_user.admin 
      country_id = Country.find_by(name: params[:project][:country]).id
      region_id = Region.find_by(name: params[:project][:region]).id
      project_status_id = ProjectStatus.find_by(name: params[:project][:project_status]).id
      if @project.update(project_params) && @project.update(country_id:country_id, region_id:region_id, project_status_id:project_status_id)
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
      params.require(:project).except(:region, :country, :project_status).permit(:title, :content, :user_id, :project_status_id, :date, :address, :city, :postal_code, :GPS, :region_id, :country_id, :image)
    end
end
