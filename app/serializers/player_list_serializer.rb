class PlayerListSerializer < ActiveModel::Serializer
  attribute(:items) do
    ActiveModelSerializers::SerializableResource.new(
      object[:items],
      each_serializer: PlayerSerializer
    )
  end
end
