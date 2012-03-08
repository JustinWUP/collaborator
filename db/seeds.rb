# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

## Settings need to be updated. Navigate to /admin/settings to change.
Setting.new(key: 'robot_login', value: 'login_name', 
	description: 'GitHub login name for authenticated requests').save
Setting.new(key: 'robot_password', value: 'SUPER_SECRET_PASSWORD', 
	description: 'Password for GitHub authenticated requests').save

Organization.new(name: "Real Decoy", org_id: 872872872 ).save

admin = User.new(email: 'admin@admin.com', password: 'password', registration_org_id: 872872872 )
admin.save
admin.roles = [Role.new(name: 'admin')]
admin.save


(1..10).each do |x|
	User.new(email: "user#{x}@example.com", password: 'password', registration_org_id: 872872872 ).save
end

repos = ['quicksnap/githubbug', 'winduppixel/wup2012', 'winduppixel/Ford-Hotshots']

(1..10).each do |x|
	Project.new(name: "Test Project #{x}", repo: repos[x%4], description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
	tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
	quis nostrud exercitation ullamco laboris \n\nLorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
	tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
	quis nostrud exercitation ullamco laboris" ).save
end

