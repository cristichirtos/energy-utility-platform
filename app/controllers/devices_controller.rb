class DevicesController < BaseController
  before_action :check_admin, except: :index

  #TODO: add index for admin and index for client
  def show
    render json: device
  end

  def create
    device = Device.new(device_params)

    if user.save
      render json: user
    else
      raise ActiveRecord::RecordInvalid.new(user)
    end
  end

  def update
  end

  def destroy
    render json: device.destroy!
  end

  private

  def device
    return @device if defined?(@device)

    @device = Device.find(params[:id])

    raise ActiveRecord::RecordNotFound if @device.nil?
  end

  def device_params
    params.require(:device).permit(:user_id, :description, :address, :maximum_hourly_consumption)
  end

  def check_admin
    raise ApplicationController::ForbiddenError unless current_user.admin? || current_user.id == device.user_id
  end
end
