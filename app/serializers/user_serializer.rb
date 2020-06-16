class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :full_name
end
