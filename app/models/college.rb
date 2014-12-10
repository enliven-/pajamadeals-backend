class College < ActiveRecord::Base
  has_and_belongs_to_many :departments
  has_many :books
  has_many :orders
  has_many :users
  belongs_to :university

  def serialized_hash(options = {})
    data = {}

    data[:id]   = college.id
    data[:name] = college.name
    data[:abbr] = college.abbr
    data[:city] = college.city

    data
  end
end
