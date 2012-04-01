# GitHubBug

A rails project that consumes and filters GitHub's Issues via v3 API via ActiveResource. Features currently (or soon will) include:

* Filter topics by labels per-project
* Assigning project visibility to users
* Some other stuff.

## Setting up 


To set up, do the following:

* `bundle`
* `rake db:setup` - This will seed the environment per db/seeds.rb
* `rails s`
* login as admin@admin.com / password 
* Go to localhost:3000/admin/settings and set up username/password for the robot settings. This allows login to github. (Will add OAuth later..)
* Tada!