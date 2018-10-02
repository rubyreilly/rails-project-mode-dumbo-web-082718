# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Project.destroy_all
Cohort.destroy_all

# cohort9=Cohort.create(current_mod: 0, start_date: Time.new(2018,10,8))
cohort8 = Cohort.create(current_mod: 1, start_date: Time.new(2018,9,17))
cohort7 = Cohort.create(current_mod: 2, start_date: Time.new(2018,8,27))
cohort6=Cohort.create(current_mod: 3, start_date: Time.new(2018,8,6))
cohort5=Cohort.create(current_mod: 4, start_date: Time.new(2018,7,16))
cohort4=Cohort.create(current_mod: 5, start_date: Time.new(2018,6,25))
cohort3=Cohort.create(current_mod: 6, start_date: Time.new(2018,6,4))
cohort2=Cohort.create(current_mod: 6, start_date: Time.new(2018,5,14))
cohort1=Cohort.create(current_mod: 6, start_date: Time.new(2018,4,23))

ruby = User.create(cohort: cohort7, first_name: "Ruby", last_name: "Reilly", username: "rubyclaroreilly@gmail.com", password_digest: BCrypt::Password.create("password123"), image_url: "https://cdn-images-1.medium.com/max/1200/1*Y-QdVVj1adXj745T7rMKMg.png", github_link: "https://github.com/rubyreilly")
jordan = User.create(cohort: cohort7, first_name: "Jordan", last_name: "Martin", username: "jdordan23@gmail.com", password_digest: BCrypt::Password.create("password"), image_url: "https://upload.wikimedia.org/wikipedia/en/thumb/3/37/Jumpman_logo.svg/1200px-Jumpman_logo.svg.png", github_link: "https://github.com/jordanmmartin")

project1 = Project.create(title: "Flatiron Event List", mod_created: 1, github_link: "https://github.com/rubyreilly/guided-module-one-final-project-dumbo-web-082718", user: ruby, image_url: "https://raw.githubusercontent.com/Thinkful/bootcamp-finder/master/bootcamps/flatiron-school/logo.png")
project2 = Project.create(title: "Marvel Hangman", mod_created: 1, github_link: "https://github.com/jordanmmartin/module-one-final-project-guidelines-dumbo-web-082718", user: jordan, image_url: "https://www.cgmagonline.com/wp-content/uploads/2018/02/marvel-celebrates-10-years-with-epic-cast-photo-6-1280x720.jpg" )
