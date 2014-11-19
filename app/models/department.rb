class Department < ActiveRecord::Base
  has_and_belongs_to_many :courses
  has_and_belongs_to_many :colleges
  has_many :books
end
