# frozen_string_literal: true

class SessionsController < BaseController
  skip_before_action :check_user_logged_in, only: :create

  def create
    user = User.find_by(username: params[:username])

    if user&.authenticate(params[:password])
      user.regenerate_access_token
      render json: user
    else
      render json: { message: 'Invalid credentials' }, status: :unauthorized
    end
  end

  def destroy
    current_user.update(access_token: nil)
    head :no_content
  end
end
