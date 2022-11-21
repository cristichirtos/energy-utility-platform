require 'sneakers'
require 'json'

class DeviceConsumptionListener
  include Sneakers::Worker
  from_queue 'device-consumption-entries', durable: true

  def work(msg)
    message = JSON.parse(msg)
    @device_id = message['device_id']
    @value = message['measurement_value']
    time = Time.at(message['timestamp']).to_datetime
    @day_and_hour = DateTime.new(time.year, time.month, time.day, time.hour, 0, 0)

    handle_message

    ack!
  end

  def handle_message
    entry = EnergyConsumptionEntry.find_or_initialize_by(device_id: @device_id, day_and_hour: @day_and_hour)
    entry.value = entry.value.present? ? entry.value + @value : @value
    entry.save
  end
end
