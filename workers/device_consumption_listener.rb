require 'sneakers'
require 'json'

class DeviceConsumptionListener
  include Sneakers::Worker
  from_queue 'device-consumption-entries', durable: true

  def work(msg)
    do_something(JSON.parse(msg))

    ack!
  end

  def do_something(err)
    puts Device.first
  end
end
