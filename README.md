##groupie
by Dex Fitch

A simple web app that lets you add venues, add bands, and create associations between bands and venues.

##Setup

In your terminal, inside this project folder:

`gem install bundle`

`bundle`

`rake db:create`

`rake db:schema:load`

`rake db:test:prepare`

`ruby app.rb`

Go to http://localhost:4567 in your browser

Enjoy!

##Tests
Testing the ruby methods can be done via rspec.

##Known Bugs
As of latest commit: None

##Motivation

To practice creating a many-to-many database that interacts with the front-end using Rake, ActiveRecord, and shoulda-matchers.

##License

MIT License, copyright 2015 dexfitch
