class MembersController < ApplicationController
    before_action :authenticate_user!
  
    def show
      user = get_user_from_token
      render json: {
        message: "User data",
        user: user
      }
    end

    def update
      params.permit!
      user = get_user_from_token
      if user
        user.update(params[:user])
        render json: {
          message: "User successfully updated",
          user: user
        }
      else
        render json: {
              message: "Something went wrong"
            }
      end
    end
  
    private
  
    def get_user_from_token
      jwt_payload = JWT.decode(request.headers['Authorization'].split(' ')[1],
                               Rails.application.credentials.devise[:jwt_secret_key]).first
      user_id = jwt_payload['sub']
      User.find(user_id.to_s)
    end
  end