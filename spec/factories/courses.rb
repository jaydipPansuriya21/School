FactoryBot.define do
  factory :course do
    sequence(:name) { |n| "Mathematics #{n}" }
    sequence(:code) { |n| "MATH101 #{n}" }
    active { true }
  end
end
