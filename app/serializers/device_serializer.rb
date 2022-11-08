class DeviceSerializer < ActiveModel::Serializer
  attributes :id, :description, :address, :maximum_hourly_consumption, :user_id, :user_username
  has_many :energy_consumption_entries

  def user_username
    object.user&.username
  end
end
