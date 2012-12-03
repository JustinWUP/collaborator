# Collaborator 

Collaborator is a blanket name for the applications we use to run our business. It helps us keep track of active projects and tasks and also acts as a repository for business and development best practices.

The Collaborator app currently contains the following additional services:
* **Knowledge** - Our private community edited wiki for employees and subcontractors. This contains our current business and project management practices, as well as a repository of development tools that others on the team have found useful.  One day, we'll perhaps separate Collaborator and Knowledge into separate pieces with oauth.
* **Resources** - A time and task tracking dashboard with reporting features that currently include active tasks and completed work for the day and week. I'll be adding some more robust team analytics and task reporting as this is still under very active development.


## Features Still To Come

* More and improved dashboards in **Resources**
* Invoicing, payment processing and account management functionality for our clients.


## Setting Up a New Dev Environment

To set up, do the following:

* `bundle`
* `rake db:setup` - This will seed the environment per db/seeds.rb
* `rails s`
* login as admin@admin.com / password 
* Tada!

For testing/development:

* `rake db:test:prepare` - Sets up the test DB
* `rake guard` - Starts Spork and guard-rspec, runs all tests, monitors updated test files and runs them. There's not much in the way of tests but more are coming soon.