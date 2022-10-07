class Device < ApplicationRecord
  belongs_to :user

  validates description, presence: true
  validates address, presence: true
  validates maximum_hourly_consumption, presence: true
end
