class Device < ApplicationRecord
  belongs_to :user, optional: true

  validates :description, presence: true
  validates :address, presence: true
  validates :maximum_hourly_consumption, presence: true
end
