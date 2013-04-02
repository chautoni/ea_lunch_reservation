class Food < ActiveRecord::Base
  attr_accessible :name, :price, :available
  scope :available, where(available: true)
end
