class Device < ApplicationRecord
  belongs_to :user, optional: true
  has_many :energy_consumption_entries, dependent: :destroy

  validates :description, presence: true
  validates :address, presence: true
  validates :maximum_hourly_consumption, presence: true
end
