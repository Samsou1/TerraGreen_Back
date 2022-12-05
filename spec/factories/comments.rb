FactoryBot.define do
  factory :comment do
    user { nil }
    project { nil }
    content { "MyText" }
  end
end
