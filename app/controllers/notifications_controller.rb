class NotificationsController < ApplicationController
  before_action :set_notification, only: %i[ show update destroy ]
  before_action :authenticate_user!

  # GET /notifications
  def index
    @notifications = Notification.where(user_id: current_user.id).reverse_order.limit(10)

    render json: @notifications
  end

  # GET /notifications/1
  def show
    render json: @notification
  end

  # POST /notifications
  def create
    @notification = Notification.new(notification_params)

    if current_user.admin && @notification.save
      render json: @notification, status: :created, location: @notification
    else
      render json: @notification.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /notifications/1
  def update
    if current_user.admin && @notification.update(notification_params)
      render json: @notification
    else
      render json: @notification.errors, status: :unprocessable_entity
    end
  end

  # DELETE /notifications/1
  def destroy
    if current_user.admin
      @notification.destroy
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_notification
      @notification = Notification.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def notification_params
      params.require(:notification).permit(:user_id, :content, :project_id)
    end
end
