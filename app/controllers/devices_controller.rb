class DevicesController < ApplicationController
  before_action :check_permission

  def show
    if device
      render json: device
    else
      render json: { error: 'not-found' }.to_json, status: :not_found
    end
  end

  def create; end

  def update; end

  def destroy; end

  private

  def check_permission
    return true if device.user == user || user.admin?

    render json: { error: 'You do not have access rights to view this page' }, status: :forbidden
  end

  def user
    return @user if defined?(@user)

    @user = User.find(request.headers['USER_ID'])
  end

  def device
    return @device if defined?(@device)

    @device = User.find(params[:id])
  end

  def device_params
    params.require(:device).permit(:description, :address, :maximum_hourly_consumption)
  end
end
