class Category <  ActiveRecord::Base
  has_many :trip_categories
  has_many :trips, through: :trip_categories

  validates :name, presence: true

  def self.trips_category
    joins(:trips).distinct
  end


end
