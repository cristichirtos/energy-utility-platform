class CreateEnergyConsumptionEntries < ActiveRecord::Migration[7.0]
  def change
    create_table :energy_consumption_entries do |t|
      t.belongs_to :device, foreign_key: true
      t.float :value

      t.timestamps
    end
  end
end
