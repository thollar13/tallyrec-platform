FactoryGirl.define do
  factory :authentication_token do
    user_id 1
    expires_at "2017-05-20 21:59:59"
    token "MyString"
    agent "MyString"
    platform "MyString"
  end
end
