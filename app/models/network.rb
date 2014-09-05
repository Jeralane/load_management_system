class Network < ActiveRecord::Base
  validates_presence_of :name, 
    uniqueness: true

  has_many :products
end
