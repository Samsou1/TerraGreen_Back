require 'faker'
require 'open-uri'

if Country.all.length == 0
  connection = ActiveRecord::Base.connection

  country_sql = File.read('db/country.sql') # Change path and filename as necessary
  country_statements = country_sql.split(/;$/)
  country_statements.pop

  region_fr_sql = File.read('db/region_fr.sql') # Change path and filename as necessary
  region_fr_statements = region_fr_sql.split(/;$/)
  region_fr_statements.pop

  region_uk_sql = File.read('db/region_uk.sql') # Change path and filename as necessary
  region_uk_statements = region_uk_sql.split(/;$/)
  region_uk_statements.pop

  ActiveRecord::Base.transaction do
    country_statements.each do |statement|
      connection.execute(statement)
    end
    region_fr_statements.each do |statement|
      connection.execute(statement)
    end
    region_uk_statements.each do |statement|
      connection.execute(statement)
    end
  end
end

countries = Country.where(active: true)
User.create!(email: Faker::Internet.email(domain: 'example'), 
password:Faker::Internet.password(min_length: 8),
username: Faker::Internet.username,
country_id: 78,
region_id: 1,
notification_subscription:true, 
description: "Hello everyone, I'm Jean-Marc from Brittany, I'm here to heal our planet. Please share."
)
User.create!(email: Faker::Internet.email(domain: 'example'), 
password:Faker::Internet.password(min_length: 8),
username: 'JMBrittany',
country_id: 78,
region_id: 2,
notification_subscription:true, 
description: "Hello everyone, I'm Jean-Marc from Brittany, I'm here to heal our planet. Please share."
)
User.create!(email: Faker::Internet.email(domain: 'example'), 
password:Faker::Internet.password(min_length: 8),
username: 'Sylvie550',
country_id: 78,
region_id: 3,
notification_subscription:true, 
description: "I like this website because it helps me do my share"
)
User.create!(email: Faker::Internet.email(domain: 'example'), 
password:Faker::Internet.password(min_length: 8),
username: 'BabooFR',
country_id: 78,
region_id: 4,
notification_subscription:true, 
description: "Hello everyone!"
)
User.create!(email: Faker::Internet.email(domain: 'example'), 
password:Faker::Internet.password(min_length: 8),
username: 'PeterFromSCO',
country_id: 78,
region_id: 5,
notification_subscription:true, 
description: "Hey I'm Peter."
)
User.create!(email: Faker::Internet.email(domain: 'example'), 
password:Faker::Internet.password(min_length: 8),
username: 'HeyMate',
country_id: 237,
region_id: 14,
notification_subscription:true, 
description: "Can you please help me clean my beach?"
)
User.create!(email: Faker::Internet.email(domain: 'example'), 
password:Faker::Internet.password(min_length: 8),
username: 'JohnS',
country_id: 237,
region_id: 15,
notification_subscription:true, 
description: "Hello world."
)
User.create!(email: Faker::Internet.email(domain: 'example'), 
password:Faker::Internet.password(min_length: 8),
username: 'Beachcleaner558',
country_id: 237,
region_id: 16,
notification_subscription:true, 
description: "Always down to clean some bitches"
)
User.create!(email: Faker::Internet.email(domain: 'example'), 
password:Faker::Internet.password(min_length: 8),
username: 'GetThisShovel',
country_id: 237,
region_id: 17,
notification_subscription:true, 
description: "If I ever find one of you littering..."
)
User.create!(email: Faker::Internet.email(domain: 'example'), 
password:Faker::Internet.password(min_length: 8),
username: 'PolicemanFromUK',
country_id: 237,
region_id: 18,
notification_subscription:true, 
description: "I'm willing to help"
)

users = User.all

ProjectStatus.create(name: 'To plan')
ProjectStatus.create(name: 'Planned')
ProjectStatus.create(name: 'In progress')
ProjectStatus.create(name: 'Done')

projectsStatuses = ProjectStatus.all

Project.create(title:'Cleaning the Square of Clermont',
  content: "Hey everyone! The square has been pretty dirty lately, why wouldnt we get together and clean up this mess?",
  project_status_id: projectsStatuses.sample.id,
  date: Faker::Date.between(from: '2023-01-01', to: '2023-12-31'),
  address: '30 Av. Vercingétorix',
  city: 'Clermont-Ferrand',
  postal_code: '63000',
  country_id: 78,
  region_id: 1,
  user_id: 1
)
image1 = URI.open("https://s.hdnux.com/photos/62/15/16/13161389/4/1200x0.jpg")
Project.find(1).image.attach(io: image1, filename: "cleaning-square-clermont")

Project.create(title:'Playground of Buxy',
  content: "Some people trashedthe playground, can you help me?",
  project_status_id: projectsStatuses.sample.id,
  date: Faker::Date.between(from: '2023-01-01', to: '2023-12-31'),
  address: '7 Rue des Cordiers',
  city: 'Buxy',
  postal_code: '71390',
  country_id: 78,
  region_id: 2,
  user_id: 2
)
image2 = URI.open("https://assets.dnainfo.com/generated/photo/2014/07/screen-shot-2014-07-01-at-15252-pm-1404237892.png/extralarge.jpg")
Project.find(2).image.attach(io: image2, filename: "cleaning-playground-buxy")

Project.create(title:'Beach cleaning',
  content: "Let's clean this beach, it could get much prettier",
  project_status_id: projectsStatuses.sample.id,
  date: Faker::Date.between(from: '2023-01-01', to: '2023-12-31'),
  address: '2 Rte des Roches Blanches',
  city: 'Douarnenez',
  postal_code: '29100',
  country_id: 78,
  region_id: 3,
  user_id: 3
)
image3 = URI.open("https://hips.hearstapps.com/popularmechanics/assets/17/20/1494955076-plastic.jpg")
Project.find(3).image.attach(io: image3, filename: "cleaning-beach-douarnenez")

Project.create(title:'Best square in UK needs to remain the best',
  content: "Hey there! on Saturday a buddy and mine have decided to tackle this issue of spreading plastic plague. Care to join?",
  project_status_id: projectsStatuses.sample.id,
  date: Faker::Date.between(from: '2023-01-01', to: '2023-12-31'),
  address: '19 Stirchley Rd',
  city: 'Telford',
  postal_code: 'TF3 1DY',
  country_id: 237,
  region_id: 14,
  user_id: 6
)
image4 = URI.open("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQcZmXPRog0qVlfIHz9c82nxRrH-WfeFbB35Q&usqp=CAU")
Project.find(4).image.attach(io: image4, filename: "cleaning-square-Telford")

Project.create(title:'Best beach in the UK!',
  content: "We need some volunteers after some junkies left their trash on the beach last night",
  project_status_id: projectsStatuses.sample.id,
  date: Faker::Date.between(from: '2023-01-01', to: '2023-12-31'),
  address: '28 St James Green',
  city: 'Southwold',
  postal_code: 'IP18 6JL',
  country_id: 237,
  region_id: 15,
  user_id: 7
)
image5 = URI.open("https://media.istockphoto.com/id/1135208857/photo/spilled-garbage-on-the-beach-of-the-big-city-empty-used-dirty-plastic-bottles-empty-used.jpg?b=1&s=170667a&w=0&k=20&c=610ey-lDXxV5N4DiRVpObqtbxhyq6N7h1yRJPtsJqGE=")
Project.find(5).image.attach(io: image5, filename: "cleaning-beach-southwold")

Project.create(title:'Time is up people',
  content: "I spotted some plastic in the forest the other day. I would appreciate the help of a few folks. I provide the beer",
  project_status_id: projectsStatuses.sample.id,
  date: Faker::Date.between(from: '2023-01-01', to: '2023-12-31'),
  address: '55 Main St',
  city: 'Aberfoyle',
  postal_code: 'FK8 3UQ',
  country_id: 237,
  region_id: 16,
  user_id: 8
)
image6 = URI.open("https://i.pinimg.com/originals/0e/47/45/0e474596096b5c9718b87ecb790f4aa4.jpg")
Project.find(6).image.attach(io: image6, filename: "cleaning-forest-aberfoyle")

projects = Project.all

20.times do 
  ProjectRegistration.create(project_id: projects.sample.id, 
    user_id: users.sample.id)
end

30.times do
  Like.create(project_id: projects.sample.id, 
    user_id: users.sample.id)
end

  Comment.create(project_id: projects.sample.id, 
    user_id: users.sample.id,
    content: 'Great idea!')
  Comment.create(project_id: projects.sample.id, 
    user_id: users.sample.id,
    content: 'Good luck!')
  Comment.create(project_id: projects.sample.id, 
    user_id: users.sample.id,
    content: 'Such trash...')
  Comment.create(project_id: projects.sample.id, 
    user_id: users.sample.id,
    content: 'I hope I can help next time')
  Comment.create(project_id: projects.sample.id, 
    user_id: users.sample.id,
    content: "I'll be there")
  Comment.create(project_id: projects.sample.id, 
    user_id: users.sample.id,
    content: 'Awesome I was wondering when somebody would be cleaning this place')
  Comment.create(project_id: projects.sample.id, 
    user_id: users.sample.id,
    content: "I'll talk about it to my family")
  Comment.create(project_id: projects.sample.id, 
    user_id: users.sample.id,
    content: 'You people are the best')
  Comment.create(project_id: projects.sample.id, 
    user_id: users.sample.id,
    content: 'What time should we meet?')
  Comment.create(project_id: projects.sample.id, 
    user_id: users.sample.id,
    content: 'I might be late but sure I will come')
  Comment.create(project_id: projects.sample.id, 
    user_id: users.sample.id,
    content: 'OMG how can people be so disgusting')
  Comment.create(project_id: projects.sample.id, 
    user_id: users.sample.id,
    content: 'Sure thing!')
  Comment.create(project_id: projects.sample.id, 
    user_id: users.sample.id,
    content: 'OMG!')
  Comment.create(project_id: projects.sample.id, 
    user_id: users.sample.id,
    content: 'Yep well thats a massive amount of trash...')
  Comment.create(project_id: projects.sample.id, 
    user_id: users.sample.id,
    content: 'I will bring glove for people who need em')
  Comment.create(project_id: projects.sample.id, 
    user_id: users.sample.id,
    content: 'Super project!')
  Comment.create(project_id: projects.sample.id, 
    user_id: users.sample.id,
    content: 'Next time I promise')
  Comment.create(project_id: projects.sample.id, 
    user_id: users.sample.id,
    content: 'Woaw')
  Comment.create(project_id: projects.sample.id, 
    user_id: users.sample.id,
    content: "It's right next to the hotel that was renovated last year right?")


