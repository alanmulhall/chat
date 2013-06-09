FactoryGirl.define do

  factory :user do
    first_name Faker::Name.first_name
    last_name  Faker::Name.last_name
  end

  factory :event do
    user
    chat_room_id 1
    event_type
  end

  factory :event_type do
    name Faker::Lorem.words(1).first
  end

  factory :message do
    content Faker::Lorem.paragraph
    user
  end

end
