FactoryBot.define do
  factory :project do
    title { "MyString" }
    content { "MyText" }
    project_status { nil }
    date { "2022-12-05" }
    address { "MyString" }
    city { "MyString" }
    postal_code { "MyString" }
    GPS { "MyString" }
    region { nil }
    country { nil }
  end
end
