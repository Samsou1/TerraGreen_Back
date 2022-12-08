class LikesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_like, only: %i[ show update destroy ]

  # GET /likes
  def index
    @likes = Like.all

    render json: @likes
  end

  def toggle
    puts params
    if Like.find_by(project_id: params[:like][:project_id], user_id:current_user.id)
      Like.find_by(project_id: params[:like][:project_id], user_id:current_user.id).destroy
      render json: {message: 'Like destroyed'}, status: :ok
    else
      @like = Like.new(like_params)
      @like.user_id = current_user.id
      if @like.save
        render json: {message: 'Like created'}, status: :ok
      else
        render json: {message: 'Something went wrong'}, status: :unprocessable_entity
      end
    end
  end

  # GET /likes/1
  def show
    render json: @like
  end

  # POST /likes
  def create
    @like = Like.new(like_params)

    if @like.save
      render json: @like, status: :created, location: @like
    else
      render json: @like.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /likes/1
  def update
    if @like.update(like_params)
      render json: @like
    else
      render json: @like.errors, status: :unprocessable_entity
    end
  end

  # DELETE /likes/1
  def destroy
    @like.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_like
      @like = Like.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def like_params
      params.require(:like).permit(:user_id, :project_id)
    end
end
