MOOCchat
========

SaaS app for integrating peer learning/peer discussion into MOOCs and
similar settings.

If you're not a developer, please go away now.

## Developers -- getting started

0. Clone this repo
0. Change into app's root directory
0. Run `bundle` to make sure you have all gems/libraries
0. First time: run `rake db:migrate db:seed` to create your development
database, populate its schema, and insert any initial data
0. `rails server --debugger` to start the app
0. It should now be live on `http://localhost:3000`

## To deploy on Heroku for your own staging:

0. First time: `heroku app:create pick-some-app-name`
0. Make sure your changes are committed locally
0. `git push heroku master`
0. Your app should now be live at `http://pick-some-app-name.herokuapp.com`

## Other useful tasks

'''Do not push code that causes these tasks to fail!'''

* `rake diagram:all` creates three `.svg` picture files in `doc/` that
contain the app's class diagrams.  The most interesting is probably `doc/models_complete.svg`
* `rake spec` runs all unit and functional tests
* `rake cucumber` runs all features that should pass (user stories)


