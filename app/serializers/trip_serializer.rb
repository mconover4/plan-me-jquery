class TripSerializer < ActiveModel::Serializer
  attributes :id, :name, :content, :user_id, :categories
  belongs_to :user, serializer: TripUserSerializer
  has_many :comments
end
