FactoryGirl.define do
  factory :book do
    title 'Lorem Ipsum'
    authors 'foo bar'
    mrp '200'

    publication
    subject
    semester
    course
    department
    university
  end
end
