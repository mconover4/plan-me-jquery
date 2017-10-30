class Trip <  ActiveRecord::Base
  belongs_to :user
  has_many :comments
  has_many :trip_categories
  has_many :categories, through: :trip_categories
  accepts_nested_attributes_for :categories, reject_if: :all_blank

  validates :name, length: { minimum: 5 }
  validates :content, length: { minimum: 600 }

  def categories_attributes=(category_attributes)
    category_attributes.values.each do |category_attribute|
      category = Category.find_or_create_by(category_attribute)
      self.categories << category
    end
  end

end
