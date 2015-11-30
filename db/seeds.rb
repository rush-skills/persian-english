# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# user = CreateAdminService.new.call
# puts 'CREATED ADMIN USER: ' << user.email
# Environment variables (ENV['...']) can be set in the file config/application.yml.
# See http://railsapps.github.io/rails-environment-variables.html

User.create(name: "Admin",email: "admin@example.com", password: "password", password_confirmation: "password")
User.create(name: "Editor",email: "editor@example.com", password: "password", password_confirmation: "password")

english_words = [
	{
		word: "",
		meaning: "",
		usage: "",
		additional: ""
	},
]

persian_words = [
	{
		word: "",
		meaning: "",
		usage: "",
		additional: ""
	},
]

english_words.each do |e|
	EnglishWord.create(word: e[:word],meaning: e[:meaning],usage: e[:usage],additional: e[:additional])
end
persian_words.each do |e|
	PersianWord.create(word: e[:word],meaning: e[:meaning],usage: e[:usage],additional: e[:additional])
end