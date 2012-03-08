# GitHubBug

A rails project that consumes and filters GitHub's Issues via v3 API via ActiveResource. Features currently (or soon will) include:

* Filter issues by labels per-project
* Assigning project visibility to users
* Some other stuff.

## Setting up 


To set up, do the following:

* `bundle`
* `rake db:setup` - This will seed the environment per db/seeds.rb
* `rails s`
* login as admin@admin.com / password, go to admin/settings and set up username/password.
* Tada!