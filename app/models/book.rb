class Book < ActiveRecord::Base
  belongs_to :university
  belongs_to :college
  belongs_to :department
  belongs_to :course
  belongs_to :semester
  belongs_to :subject

  has_many :images
end
