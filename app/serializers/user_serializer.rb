class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :password, :personality, :reason, :international, :companion, :budget, :role
  has_many :trips
end
