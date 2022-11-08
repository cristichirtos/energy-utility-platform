# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.destroy_all
Device.destroy_all
EnergyConsumptionEntry.destroy_all

User.create!([
  {
    username: 'client',
    name:     'Test Client',
    password: 'password',
    admin:    false
  },
  {
    username: 'another-client',
    name:     'Another Client',
    password: 'password',
    admin:    false
  },
  {
    username: 'yet-another-client',
    name:     'Yet Another Client',
    password: 'password',
    admin:    false
  },
  {
    username: 'admin',
    name:     'Test Admin',
    password: 'password',
    admin:    true
  },
  {
    username: 'another-admin',
    name:     'Another Admin',
    password: 'password',
    admin:    true
  }
])

Device.create!([
  {
    description:                'Device created for testing purposes',
    address:                    'Testing Address no. 24',
    maximum_hourly_consumption: 1.2,
    user_id:                    User.find_by(username: 'client').id
  },
  {
    description:                'Another device created for testing purposes',
    address:                    'Testing Address no. 48',
    maximum_hourly_consumption: 0.8,
    user_id:                    User.find_by(username: 'client').id
  },
  {
    description:                'A real device',
    address:                    'Actual Address no. 21',
    maximum_hourly_consumption: 1.1,
    user_id:                    User.find_by(username: 'client').id
  },
  {
    description:                'Yet another device created for testing purposes',
    address:                    'Fake Address no. 112',
    maximum_hourly_consumption: 0.5,
    user_id:                    User.find_by(username: 'another-client').id
  },
  {
    description:                'A random device',
    address:                    'Somewhere St.',
    maximum_hourly_consumption: 0.8,
    user_id:                    nil
  },
  {
    description:                'A free device',
    address:                    'Unoccupied St. no. 89',
    maximum_hourly_consumption: 0.95,
    user_id:                    nil
  }
])

random = Random.new

first_device = Device.find_by(description: 'Device created for testing purposes')

24.times { |index| EnergyConsumptionEntry.create!(device: first_device, value: random.rand(first_device.maximum_hourly_consumption).round(3), created_at: Date.yesterday) }
24.times { |index| EnergyConsumptionEntry.create!(device: first_device, value: random.rand(first_device.maximum_hourly_consumption).round(3), created_at: Date.today) }
24.times { |index| EnergyConsumptionEntry.create!(device: first_device, value: random.rand(first_device.maximum_hourly_consumption).round(3), created_at: Date.tomorrow) }
24.times { |index| EnergyConsumptionEntry.create!(device: first_device, value: random.rand(first_device.maximum_hourly_consumption).round(3), created_at: 2.days.from_now) }

second_device = Device.find_by(description: 'Another device created for testing purposes')

24.times { |index| EnergyConsumptionEntry.create!(device: second_device, value: random.rand(second_device.maximum_hourly_consumption).round(3), created_at: Date.yesterday) }
24.times { |index| EnergyConsumptionEntry.create!(device: second_device, value: random.rand(second_device.maximum_hourly_consumption).round(3), created_at: Date.today) }
24.times { |index| EnergyConsumptionEntry.create!(device: second_device, value: random.rand(second_device.maximum_hourly_consumption).round(3), created_at: Date.tomorrow) }
24.times { |index| EnergyConsumptionEntry.create!(device: second_device, value: random.rand(second_device.maximum_hourly_consumption).round(3), created_at: 2.days.from_now) }
