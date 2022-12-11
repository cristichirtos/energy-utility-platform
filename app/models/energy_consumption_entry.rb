class EnergyConsumptionEntry < ApplicationRecord
  belongs_to :device
  after_save :check_energy_consumption

  private

  def check_energy_consumption
    if value > device.maximum_hourly_consumption
      NotificationsService.broadcast(
        user_id: device.user_id,
        message: "Device with id #{device_id} exceeded its maximum energy consumption!"
      )
    end
  end
end
