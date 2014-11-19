class College < ActiveRecord::Base
  has_and_belongs_to_many :departments
  belongs_to :university
end
