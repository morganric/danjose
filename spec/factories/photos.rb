# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :photo do
    title "MyString"
    image "MyString"
    thumbnail "MyString"
    song_title "MyString"
    song_artist "MyString"
    song_url "MyString"
    published false
    embed_code "MyText"
  end
end
