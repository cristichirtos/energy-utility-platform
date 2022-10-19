class DevicesController < BaseController
  before_action :check_admin, except: :client_index

  def admin_index
    render json: Device.all
  end

  def client_index
    render json: Device.includes(:energy_consumption_entries).where(user_id: current_user.id),
      include: [energy_consumption_entries: { only: %i[created_at value] }]
  end

  def show
    render json: device
  end

  def create
    device = Device.new(device_params)

    if device.save
      render json: device
    else
      raise ActiveRecord::RecordInvalid.new(device)
    end
  end

  def update
    if device.update(device_params)
      render json: device
    else
      raise ActiveRecord::RecordInvalid.new(device)
    end
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
    params.permit(:user_id, :description, :address, :maximum_hourly_consumption)
  end

  def check_admin
    raise ApplicationController::ForbiddenError unless current_user.admin? || current_user.id == device.user_id
  end
end
