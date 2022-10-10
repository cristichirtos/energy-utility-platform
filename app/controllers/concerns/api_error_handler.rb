module ApiErrorHandler
  extend ActiveSupport::Concern

  included do
    rescue_from ActiveRecord::RecordNotFound do |exception|
      render json: {
        message: 'Not found',
      }, status: :not_found
    end

    rescue_from ActiveRecord::RecordInvalid do |exception|
      render json: {
        message: 'Validation Failed',
        errors: exception.record.errors.full_messages
      }, status: :unprocessable_entity
    end

    rescue_from ApplicationController::UnauthorizedError do |exception|
      render json: {
        message: 'Unauthorized'
      }, status: :unauthorized
    end

    rescue_from ApplicationController::ForbiddenError do |exception|
      render json: {
        message: 'Forbidden'
      }, status: :forbidden
    end
  end
end
