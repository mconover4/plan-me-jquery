class CommentSerializer < ActiveModel::Serializer
  attributes :id, :content, :trip, :user
  belongs_to :trip
  belongs_to :user
end
