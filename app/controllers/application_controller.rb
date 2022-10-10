class ApplicationController < ActionController::API
  class UnauthorizedError < StandardError; end
  class ForbiddenError < StandardError; end
end
