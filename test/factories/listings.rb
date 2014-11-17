FactoryGirl.define do
  factory :listing do
    title 'lorem ipsum dallar sitmat'
    description 'lorem'
    price '100'
    quality 0
    markings 0
    edition '1st'
    user

    before(:create) { |instance| instance.send(:set_college) }
  end
end
