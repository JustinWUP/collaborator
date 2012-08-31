# GitHubBug

GitHubBug will soon be renamed Collaborator. It is currently a simple issue tracking system for client-agency collaboration. 
GHB used to encapsulate the GitHub API, pulling in Issues/Comments via an ActiveResource library. This library can be found 
on tag "remove_github" and will be  turned into a simple library soon enough. See 
[this directory](https://github.com/quicksnap/githubbug/tree/remove_github/app/models/github) for the code.

## Setttting up 

To set up, do the following:

* `bundle`
* `rake db:setup` - This will seed the environment per db/seeds.rb and the test DB	
* `rails s`
* login as admin@admin.com / password 
* Go to localhost:3000/admin/settings and set up username/password for the robot settings. This allows login to github. (Will add OAuth later..)
* Tada!

For development:

* `rake db:test:prepare` - Sets up the test DB
* `guard` - Starts Spork and guard-rspec, runs all tests, monitors updated test files and runs them