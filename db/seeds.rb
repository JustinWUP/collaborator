Organization.new(name: "Wind Up Pixel", org_id: 872872872 ).save
Organization.new(name: "WUP Contractor", org_id: 696969 ).save
Organization.new(name: "Real Decoy", org_id: 12345 ).save

admin = User.new(email: 'admin@admin.com', password: 'password', registration_org_id: 872872872 )
admin.save
admin.roles = [Role.new(name: 'admin')]
admin.save


(1..4).each do |x|
	User.new(email: "user#{x}@winduppixeltest.com", password: 'password', registration_org_id: 872872872 ).save
end

(1..4).each do |x|
	User.new(email: "user#{x}@wuptest.com", password: 'password', registration_org_id: 696969 ).save
end

(1..4).each do |x|
	User.new(email: "user#{x}@rdclienttest.com", password: 'password', registration_org_id: 12345 ).save
end

repos = ['quicksnap/Issues-Test-Repo', 'quicksnap/githubbug', 'winduppixel/wup2012', 'winduppixel/Ford-Hotshots']
urls = ['http://clients.winduppixel.com/sites/sciemetric' , 'http://google.com', 'http://wot.com', 'http://test.com']

(1..10).each do |x|
	Project.new(name: "Test Project #{x}", repo: repos[x%4], url: urls[x%4], description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
	tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
	quis nostrud exercitation ullamco laboris \n\nLorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
	tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
	quis nostrud exercitation ullamco laboris" ).save
end

