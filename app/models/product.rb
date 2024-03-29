class Product < ActiveRecord::Base
  validates_presence_of :name

  validate :price,
    numericality: { greater_than: 0 }

  belongs_to :network
end
