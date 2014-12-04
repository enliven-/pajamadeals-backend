FactoryGirl.define do
  factory :listing do
    description 'lorem'
    price '100'
    quality 'like new'
    markings 'no markings'
    user
    book
    before(:create) { |instance| instance.send(:set_college) }
  end
end
