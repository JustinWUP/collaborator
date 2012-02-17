# GitHubBug

A rails project that filters GitHub's Issues via v3 API (through Octokit). Features currently (or soon will) include:

* Filter issues by labels per-project
* Assigning project visibility to users
* Some other stuff.

##Setting up 


To set up, do the following:

* `bundle`
* `rake db:setup` - This will seed the environment per db/seeds.rb
* `rails s`
* Tada!