class User < ActiveRecord::Base
  has_secure_password

  has_many :sims
  has_many :transactions

  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i

  validates :username, 
    presence: true,
    length: { within: 4..25 },
    uniqueness: true,
    exclusion: { in: %w(admin superuser) }

  validates :first_name,
    presence: true,
    length: { maximum: 25 }

  validates :last_name,
    presence: true,
    length: { maximum: 50 }

  validates :email,
    format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, on: :create }

  scope :sorted, lambda { order("last_name ASC, first_name ASC") }

  def name
    [first_name, last_name].join(' ')
  end

end
