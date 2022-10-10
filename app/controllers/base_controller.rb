class BaseController < ApplicationController
  include ApiErrorHandler

  before_action :check_user_logged_in

  protected

  def check_user_logged_in
    raise ApplicationController::UnauthorizedError if request.headers['HTTP_ACCESS_TOKEN'].blank? || current_user.nil?
  end

  def current_user
    @current_user ||= User.find_by(access_token: request.headers['HTTP_ACCESS_TOKEN'])
  end
end
