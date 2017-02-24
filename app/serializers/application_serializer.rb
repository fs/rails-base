class ApplicationSerializer < ActiveModel::Serializer
  def self.decorate_collection(collection)
    ActiveModel::Serializer::CollectionSerializer.new(collection)
  end
end
