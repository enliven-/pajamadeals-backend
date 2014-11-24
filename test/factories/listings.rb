FactoryGirl.define do
  factory :listing do
    description 'lorem'
    price '100'
    quality 0
    markings 0
    user
    book
    before(:create) { |instance| instance.send(:set_college) }
  end
end
