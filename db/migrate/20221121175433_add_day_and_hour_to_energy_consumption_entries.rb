class AddDayAndHourToEnergyConsumptionEntries < ActiveRecord::Migration[7.0]
  def change
    add_column :energy_consumption_entries, :day_and_hour, :datetime
    add_index :energy_consumption_entries, [:device_id, :day_and_hour], unique: true
  end
end
