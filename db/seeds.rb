require 'faker'

if Country.all.length == 0
  connection = ActiveRecord::Base.connection

  country_sql = File.read('db/country.sql') # Change path and filename as necessary
  country_statements = country_sql.split(/;$/)
  country_statements.pop

  region_sql = File.read('db/region_fr.sql') # Change path and filename as necessary
  region_statements = region_sql.split(/;$/)
  region_statements.pop

  ActiveRecord::Base.transaction do
    country_statements.each do |statement|
      connection.execute(statement)
    end
    region_statements.each do |statement|
      connection.execute(statement)
    end
  end
end

countries = Country.where(active: true)

10.times do
  country = countries.sample
  region = country.regions.sample
  User.create!(email: Faker::Internet.email(domain: 'example'), 
  password:Faker::Internet.password(min_length: 8),
  username: Faker::Internet.username,
  country_id: country.id,
  region_id: region.id,
  admin: false,
  notification_subscription: [true, false].sample,
  description: Faker::Lorem.sentence(word_count: 10)
)
end

users = User.all

ProjectStatus.create(name: 'To plan')
ProjectStatus.create(name: 'Planned')
ProjectStatus.create(name: 'In progress')
ProjectStatus.create(name: 'Done')

projectsStatuses = ProjectStatus.all

20.times do 
  country = countries.sample
  region = country.regions.sample
  Project.create(title: Faker::Lorem.word,
    content: Faker::Lorem.sentence(word_count: 10),
    project_status_id: projectsStatuses.sample.id,
    date: Faker::Date.between(from: '2020-01-01', to: '2023-12-31'),
    address: Faker::Address.street_address,
    city: Faker::Address.city,
    postal_code: Faker::Address.zip,
    GPS: Faker::Address.latitude.to_s + " " + Faker::Address.longitude.to_s,
    country_id: country.id,
    region_id: region.id,
    user_id: users.sample.id
  )
end

projects = Project.all

60.times do 
  ProjectRegistration.create(project_id: projects.sample.id, 
    user_id: users.sample.id)
end

100.times do
  Like.create(project_id: projects.sample.id, 
    user_id: users.sample.id)
end

60.times do 
  Comment.create(project_id: projects.sample.id, 
    user_id: users.sample.id,
    content: Faker::Lorem.sentence(word_count: 10))
end

60.times do 
  Notification.create(project_id: projects.sample.id,
    user_id: users.sample.id,
    content: Faker::Lorem.sentence(word_count: 10))
end