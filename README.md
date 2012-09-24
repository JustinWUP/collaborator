# Collaborator

Collaborator is the Wind Up Pixel project management system for our clients, partners and employees. 

It will probably be the first in a series of enterprise apps we'll develop for our business.

## Setting up 

To set up, do the following:

* `bundle`
* `rake db:setup` - This will seed the environment per db/seeds.rb
* `rails s`
* login as admin@admin.com / password 
* Go to localhost:3000/admin/settings and set up username/password for the robot settings. This allows login to github. (Will add OAuth later..)
* Tada!

For development:

* `rake db:test:prepare` - Sets up the test DB
* `rake guard` - Starts Spork and guard-rspec, runs all tests, monitors updated test files and runs them