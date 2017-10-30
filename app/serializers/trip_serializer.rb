class TripSerializer < ActiveModel::Serializer
  attributes :id, :name, :content, :user_id, :categories
  belongs_to :user
end
