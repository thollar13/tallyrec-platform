FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "email#{n}@tallyrec.com" }
    password 'kaoaewb19dk8'
  end
end
