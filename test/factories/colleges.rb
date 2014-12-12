FactoryGirl.define do
  factory :college do
    name 'Foo bar institute'
    abbr 'FBI'
    zipcode '422009'

    university
  end

  factory :vit, class: College do
    name 'Vishwakarma Institute of Technology'
    abbr 'VIT'
    zipcode '411037'

    university
  end

  factory :mit, class: College do
    name 'Maharashtra Institute of Technolog'
    abbr 'MIT'
    zipcode '411038'

    university
  end

  factory :mitcoe, class: College do
    name 'MIT College of Engineering'
    abbr 'MITCOE'
    zipcode '411038'

    university
  end
end
