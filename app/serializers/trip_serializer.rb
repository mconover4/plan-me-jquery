class TripSerializer < ActiveModel::Serializer
  attributes :id, :name, :content, :user_id, category_ids:[], categories_attributes: [:name]
  belongs_to :user
end
