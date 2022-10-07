class CreateDevices < ActiveRecord::Migration[7.0]
  def change
    create_table :devices do |t|
      t.text :description
      t.string :address
      t.float :maximum_hourly_consumption

      t.timestamps
    end
  end
end
