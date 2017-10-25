class User <  ActiveRecord::Base
  ROLES = %w[admin planner goer].freeze
  has_many :trips
  has_many :trip_categories, through: :trips
  accepts_nested_attributes_for :trips

  has_secure_password
  validates :email, :name, :personality, :reason, :international, presence: true
  validates :email, :name, uniqueness: true
  validates :role, inclusion: { in: %w(admin planner goer) }

  def self.find_or_create_by_omniauth(auth_hash)
    where(email: auth_hash['info']['email']).first_or_create do |user|
      user.password = SecureRandom.hex
    end
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

  def self.with_role(role)
     @admins = Role.find_by_name('admin').users
     @planners = Role.find_by_name('planner').users
     @goers = Role.find_by_name('goer').users
  end

end
