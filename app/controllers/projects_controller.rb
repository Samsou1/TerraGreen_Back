class ProjectsController < ApplicationController
  before_action :set_project, only: %i[ show update destroy ]
  before_action :authenticate_user!, only: %i[create update destroy]

  # GET /projects
  def index
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
      @projects = Project.all
    end
    render json: ProjectSerializer.new(@projects).serializable_hash[:data]
    
  end

  # GET /projects/1
  def show
    render json: {project: @project, image_url: ProjectSerializer.new(@project).serializable_hash[:data][:attributes][:image_url], country:@project.country.name, region: @project.region.name, status: @project.project_status.name, comments: @project.comments.includes(:user).select('id, content, user, user_id, created_at'), likes: @project.likes.select('id, user_id'), project_registrations: @project.project_registrations.select('id, user_id'), user: @project.user}
  end

  # POST /projects
  def create
    @project = Project.new(project_params)
    if @project.save
      render json: @project, status: :created, location: @project
    else
      render json: @project.errors, status: :unprocessable_entity
    end
  end

  after_action :send_notifications_of_project_creation, only: [:create]

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
      params.require(:project).permit(:user_id, :title, :content, :date, :address, :city, :postal_code, :project_status_id, :region_id, :country_id, :image).except(:region, :country, :project_status)
    end

    def send_notifications_of_project_creation
      @latest_project = Project.last
      @users = User.where(notification_subscription: true, region_id: @latest_project.region_id)
      @users.each do |user|
        Notification.create(user_id: user.id, content: 'A new project has been created in your region. You should check it out.',project_id: @latest_project.id)
      end
    end
end
