require_relative '../../workers/device_consumption_listener'

task :amqp => :environment do
  DeviceConsumptionListener
  Rake::Task['sneakers:run'].invoke
end
