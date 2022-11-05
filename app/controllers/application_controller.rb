class ApplicationController < ActionController::API
  before_action :cors_set_access_control_headers

  def cors_preflight_check
    if request.method == 'OPTIONS'
      cors_set_access_control_headers
      render text: '', content_type: 'text/plain'
    end
  end

  protected

  def cors_set_access_control_headers
    response.headers['Access-Control-Allow-Origin'] = '*'
    response.headers['Access-Control-Allow-Methods'] = 'POST, GET, PUT, PATCH, DELETE, OPTIONS'
    response.headers['Access-Control-Allow-Headers'] = '*'
    response.headers['Access-Control-Max-Age'] = '1728000'
  end

  class UnauthorizedError < StandardError; end
  class ForbiddenError < StandardError; end
end
