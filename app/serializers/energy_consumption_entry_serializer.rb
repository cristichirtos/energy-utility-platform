class EnergyConsumptionEntrySerializer < ActiveModel::Serializer
  attributes :value, :timestamp

  def timestamp
    object.created_at.to_datetime
  end
end
