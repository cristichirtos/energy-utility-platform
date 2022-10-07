# frozen_string_literal: true

class SessionsController < BaseController
  skip_before_action :doorkeeper_authorize!, only: :create

  def create
    user = User.find_by(username: params[:username])

    if user&.authenticate(params[:password])
      render json: user, with_credentials: true
    else
      render_error_message('Invalid email or password!')
    end
  end

  def destroy
    doorkeeper_token.destroy!

    head :no_content
  end
end
