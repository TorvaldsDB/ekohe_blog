# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
if Rails.env.development?
  unless User.exists?(admin: true)
    p '---------- New a admin ----------'
    FactoryGirl.create(:admin, email: "admin@gmail.com", password: "ekoheadmin123")
    p '---------- Congratulations! Created an admin. ----------'
  end

  p '---------- New some users ----------'
  FactoryGirl.create_list(:user, 50, password: "ekohe123")
  p '---------- Congratulations! Created 50 users. ----------'
end
