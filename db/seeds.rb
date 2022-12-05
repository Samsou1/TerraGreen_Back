require 'faker'

10.times do
  User.create!(email: Faker::Internet.email(domain: 'example'), password:Faker::Internet.password(min_length: 8))
end

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

countries = Country.where(active:true)
users = User.all

