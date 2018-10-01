# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

UserProject.destroy_all
User.destroy_all
Project.destroy_all
Cohort.destroy_all

cohort1 = Cohort.create(current_mod: 2, start_date: Time.new(2018,8,27))
cohort2 = Cohort.create(current_mod: 1, start_date: Time.new(2018,9,17))

ruby = User.create(cohort: cohort1, first_name: "Ruby", last_name: "Reilly", email: "rubyclaroreilly@gmail.com", password: "asdfghjkl;'", image_url: "https://cdn-images-1.medium.com/max/1200/1*Y-QdVVj1adXj745T7rMKMg.png", github_link: "https://github.com/rubyreilly")
jordan = User.create(cohort: cohort2, first_name: "Jordan", last_name: "Martin", email: "jdordan23@gmail.com", password: "password;'", image_url: "https://upload.wikimedia.org/wikipedia/en/thumb/3/37/Jumpman_logo.svg/1200px-Jumpman_logo.svg.png", github_link: "https://github.com/jordanmmartin")

project1 = Project.create(title: "Flatiron Event List", mod_created: 1, github_link: "https://github.com/rubyreilly/guided-module-one-final-project-dumbo-web-082718")
project2 = Project.create(title: "Marvel Hangman", mod_created: 1, github_link: "https://github.com/jordanmmartin/guided-module-one-final-project-dumbo-web-082718")

user_project1 = UserProject.create(project: project1, user: ruby)
user_project2 = UserProject.create(project: project2, user: jordan)
