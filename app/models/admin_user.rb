class AdminUser < ActiveRecord::Base
  has_many :orders
end
