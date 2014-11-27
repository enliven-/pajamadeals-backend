FactoryGirl.define do
  factory :user do
    name 'Foo Bar'
    mobile '9975454384'
    college
  end

 factory :ankush, class: User do
   name 'Ankush Zanwar'
   mobile '9976543210'

   college
 end
end
