# Collaborator 

Collaborator is the Wind Up Pixel project management system for our clients, partners and employees. 

The project management side was first in a series of enterprise apps we'll develop for our business. 

The Collaborator app now contains the following additional services:
* **Knowledge** - Our private community edited wiki for our employees and subcontractors.  One day, I'll separate Collaborator and Knowledge into separate pieces with oauth.
* **Resources** - A time and task tracking dashboard with reporting features that currently include active tasks and completed work for the day and week. I'll be adding some more robust team analytics and task reporting as this is still under very active development.

## Setting up 

To set up, do the following:

* `bundle`
* `rake db:setup` - This will seed the environment per db/seeds.rb
* `rails s`
* login as admin@admin.com / password 
* Tada!

For development:

* `rake db:test:prepare` - Sets up the test DB
* `rake guard` - Starts Spork and guard-rspec, runs all tests, monitors updated test files and runs them