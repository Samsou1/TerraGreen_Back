require 'faker'

10.times do
  User.create!(email: Faker::Internet.email(domain: 'example'), password:Faker::Internet.password(min_length: 8))
end
