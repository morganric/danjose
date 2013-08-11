# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :guess do
    title "MyString"
    artist "MyString"
    url "MyString"
    provider "MyString"
    embed_code "MyText"
    correct false
    user_id 1
    post_id 1
  end
end
