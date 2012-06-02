FactoryGirl.define do
  sequence :id do |n|
    n
  end

  factory :user do
    name {"John#{generate(:id)}"}
    facebook_id  { generate(:id)}
    email {"#{name}@test.com"}
    pending false
  end
end

