class User <  ActiveRecord::Base
  ROLES = %w[admin planner goer].freeze
  has_many :trips
  has_many :comments
  has_many :trip_categories, through: :trips
  accepts_nested_attributes_for :trips

  has_secure_password
  validates :email, :name, :personality, :reason, :international, :companion, :budget, presence: true
  validates :email, :name, uniqueness: true
  validates :role, inclusion: { in: %w(admin planner goer) }

  def self.find_or_create_by_omniauth(auth_hash)
    where(email: auth_hash['info']['email']).first_or_create do |user|
      user.password = SecureRandom.hex
    end
  end

  def self.romantics
    where(personality: 'Romantic')
  end

  def self.honeymooners
    where(reason: 'Honeymoon')
  end

  def self.connoisseurs
    where(personality: 'Intellectual').where(reason: 'For Tourism')
  end

  def self.luckystars
    where(budget: '$10,000').where(international: 'Yes')
  end

  def self.roadtrippers
    where(budget: '$1,000').where(international: 'No').where(companion: '1-2')
  end

  def is_admin?
    role == 'admin'
  end

  def self.admins
    where("role = 'admin'")
  end

  def self.planners
    where("role = 'planner'")
  end

  def self.goers
    where("role = 'goer'")
  end
end
