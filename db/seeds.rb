# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# first_user = User.find(1)

# first_user.roles.create(name: "Admin")


admin = User.new(email: 'admin@admin.com', password: 'password')
admin.save
admin.roles = [Role.new(name: 'admin')]

(1..10).each do |x|
	User.new(email: "user#{x}@example.com", password: 'password').save
end

repos = ['rails/rails', 'bartaz/impress.js', 'quicksnap/githubbug', 'twitter/bootstrap']

(1..30).each do |x|
	Project.new(name: "Test Project #{x}", repo: repos[x%4], description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
	tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
	quis nostrud exercitation ullamco laboris \n\nLorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
	tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
	quis nostrud exercitation ullamco laboris" ).save
end

