FactoryGirl.define do
  factory :image do
    file { File.open(File.join(App.root, 'test', 'fixtures', 'test_image1.jpg'
                                                                            )) }
    book
  end
end
