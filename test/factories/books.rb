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

    factory :book_with_images do
      transient do
        images_count 5
      end

      after(:create) do |book, evaluator|
        create_list(:image, evaluator.images_count, book: book)
      end
    end
  end
end
