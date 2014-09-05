class Products < ActiveRecord::Base
  validates_presence_of :name

  validate :amount,
    numericality: { greater_than: 0 }

  belongs_to :network
end
