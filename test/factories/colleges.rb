FactoryGirl.define do
  factory :college do
    name 'Foo bar institute'
    abbr 'FBI'
    zipcode '422009'
  end

  factory :vit, class: College do
    name 'Vishwakarma Institute of Technology'
    abbr 'VIT'
    zipcode '411037'
  end
end
