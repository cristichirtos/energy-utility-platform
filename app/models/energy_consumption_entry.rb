class EnergyConsumptionEntry < ApplicationRecord
  belongs_to :device
  after_save :check_energy_consumption

  private

  def check_energy_consumption
    if self.value > self.device.maximum_hourly_consumption
      #TODO: tell FE via WebSockets
    end
  end
end
