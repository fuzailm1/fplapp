class FixtureListSerializer < ActiveModel::Serializer
  class PlayerListSerializer < ActiveModel::Serializer
    attribute(:items) do
      ActiveModelSerializers::SerializableResource.new(
        object[:items],
        each_serializer: FixtureSerializer
      )
    end
  end
end
