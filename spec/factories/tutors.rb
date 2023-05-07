FactoryBot.define do
  factory :tutor do
    first_name { "Tanmay" }
    last_name { "Shah" }
    sequence(:phone_number) { |n| "99810#{n}719#{n}" }
    course
  end
end
