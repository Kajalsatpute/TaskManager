FactoryBot.define do
  factory :task do
    title { Faker::Lorem.sentence }
    description { Faker::Lorem.paragraph }
    state { "Backlog" }
    deadline { Faker::Time.forward(days: 5, period: :evening) }
    association :user
  end
end
