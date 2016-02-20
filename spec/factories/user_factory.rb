FactoryGirl.define do
  sequence :email do |n|
    "email#{n}@factory.com"
  end
  
  factory :user do
    email
    password "abc1234@"
  end
end