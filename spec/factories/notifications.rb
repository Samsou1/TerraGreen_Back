FactoryBot.define do
  factory :notification do
    user { nil }
    content { "MyString" }
    project { nil }
  end
end
