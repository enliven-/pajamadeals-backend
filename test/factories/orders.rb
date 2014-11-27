FactoryGirl.define do
  factory :order do
    listing
    association :buyer, factory: :ankush

    before(:create) { |instance| instance.send(:set_college) }
  end
end
