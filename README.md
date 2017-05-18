# Rails Base

[![Build Status](https://semaphoreci.com/api/v1/fs/rails-base/branches/master/shields_badge.svg)](https://semaphoreci.com/fs/rails-base)
[![Test Coverage](https://codeclimate.com/github/fs/rails-base/badges/coverage.svg)](https://codeclimate.com/github/fs/rails-base)
[![Code Climate](https://codeclimate.com/github/fs/rails-base.png)](https://codeclimate.com/github/fs/rails-base)

Rails Base is the base Rails application template used at Flatstack.
It's based on Rails 5 and Ruby 2.3.3.

## Application Gems

* [Sass](https://github.com/rails/sass-rails) for Sass/Scss stylesheets
* [Zurb Foundation](https://github.com/zurb/foundation-rails) as CSS framework.
  For more information see [documentation on using Foundation in Rails apps](http://foundation.zurb.com/docs/applications.html)
* [Foundation Icon Font](https://github.com/zaiste/foundation-icons-sass-rails) for icons. Browse [icon set](http://zurb.com/playground/foundation-icon-fonts-3) examples
* [Autoprefixer](https://github.com/ai/autoprefixer-rails) for writing CSS without vendor prefixes
* [Slim](https://github.com/slim-template/slim) for views
* [Simple Form](https://github.com/plataformatec/simple_form) for forms
* [Responders](https://github.com/plataformatec/responders) to DRY controllers
* [Decent Exposure](https://github.com/voxdolo/decent_exposure) to DRY controllers
* [Draper](https://github.com/drapergem/draper) to decorate models for views
* [Decent Decoration](https://github.com/netguru/decent_decoration) to extend Decent Exposure with Draper
* [Interactors](https://github.com/collectiveidea/interactor) encapsulates application's business logic
* [Pundit](https://github.com/elabs/pundit) to encapsulates authorization logic
* [Kaminari](https://github.com/amatsuda/kaminari) for pagination
* [Devise](http://github.com/plataformatec/devise) for basic auth
* [Rollbar](https://github.com/rollbar/rollbar-gem) for exception notification
* [Google Analytics Rails](https://github.com/bgarret/google-analytics-rails) for Google Analytics support

## Development Gems

* [Puma](https://github.com/puma/puma) as Rails web server
* [Letter Opener](https://github.com/ryanb/letter_opener) for opening mail in the browser instead of sending it
* [Bullet](https://github.com/flyerhzm/bullet) for detecting N+1 queries and unused eager loading
* [Rubocop](https://github.com/bbatsov/rubocop) and [Rubocop-Rspec](https://github.com/nevir/rubocop-rspec)
  for reporting violations of the Ruby style guide
* [Brakeman](https://github.com/presidentbeef/brakeman) for checking application for common security vulnerabilities
* [Pry Rails](https://github.com/rweng/pry-rails) for interactively exploring objects
* [Bundler Audit](https://github.com/rubysec/bundler-audit) for scanning the Gemfile for
  insecure dependencies based on published CVEs
* [Spring](https://github.com/rails/spring) for fast Rails actions via
  pre-loading
* [Web Console](https://github.com/rails/web-console) for better debugging via
  in-browser IRB consoles
* [SCSS-Lint](https://github.com/brigade/scss-lint) for reporting violations of SCSS coding conventions
* [Coffeelint](https://github.com/clutchski/coffeelint) to keep Coffeescript code clean and consistent
* [Slim-Lint](https://github.com/sds/slim-lint) for reporting violations of Ruby style guide in `.slim` templates
* [Rails ERD](https://github.com/voormedia/rails-erd) for generating a diagram based on application's AR models

## Testing Gems

* [Capybara](https://github.com/jnicklas/capybara) and [poltergeist](https://github.com/teampoltergeist/poltergeist)
  for integration testing, including JavaScript behavior
* [Jasmine](http://jasmine.github.io/) for unit testing JavaScript code
* [Jasmine jQuery](https://github.com/velesin/jasmine-jquery) for jQuery matchers and
  fixtures in Jasmine
* [Factory Girl](https://github.com/thoughtbot/factory_girl) for test data
* [RSpec](https://github.com/rspec/rspec) for unit testing
* [Shoulda Matchers](http://github.com/thoughtbot/shoulda-matchers) for common RSpec matchers
* [Email Spec](https://github.com/bmabey/email-spec) for common matchers for testing emails

## Initializers

* `mailer.rb` - setup default hosts for mailer from configuration
* `requires.rb` - automatically requires everything in lib/ & lib/extensions

## Scripts

* `bin/setup` - setup required gems and migrate db if needed
* `bin/quality` - runs rubocop, brakeman, rails_best_practices and bundle-audit for the app
* `bin/ci` - should be used in the CI or locally
* `bin/server` - to run server locally

## Getting Started

### Prepare dependencies

Some gems have native extensions.
You should have GCC installed on your development machine.

* `phantomjs` - to run Javascript unit tests
* `graphviz` - to generate Entity-Relationship Diagram

Setup required dependencies from `Brewfile`:
```bash
brew tap Homebrew/bundle
brew bundle
```

### Bootstrap application

1. Clone application as new project with original repository named "rails-base".

   ```bash
   git clone git://github.com/fs/rails-base.git --origin rails-base [MY-NEW-PROJECT]
   ```

2. Create your new repo on GitHub and push master into it. Make sure master branch is tracking origin repo.

  ```bash
  git remote add origin git@github.com:[MY-GITHUB-ACCOUNT]/[MY-NEW-PROJECT].git
  git push -u origin master
  ```

3. Run setup script

  ```bash
  bin/setup
  ```

4. Run test and quality suits to make sure all dependencies are satisfied and applications works correctly before making changes.

  ```bash
  bin/ci
  ```

5. Run app

  ```bash
  bin/server
  ```

6. Update README

  Do not forget to update application `README.md` file with detailed information based on the
  existing template.

  ```bash
  mv doc/README_TEMPLATE.md README.md
  # update README.md
  git commit -am "Update README.md"
  ```

## Deployment

### Heroku

Out of the box Rails Base ready to be deployed to [Heroku.com](http://heroku.com).

* [Heroku Postgres](https://www.heroku.com/postgres) add-on will be used for database.
* [SendGrid](https://devcenter.heroku.com/articles/sendgrid#ruby-rails) add-on required to be able to send emails.
* [NewRelic](https://devcenter.heroku.com/articles/newrelic#ruby-installation-and-configuration) add-on could be used to monitor application performance.
* [Rollbar](https://elements.heroku.com/addons/rollbar) add-on could be used to application errors.

```bash
heroku create --addons=heroku-postgresql,sendgrid,newrelic,rollbar --remote staging rails-base-example
heroku config:add HOST="rails-base-example.herokuapp.com" MAILER_SENDER_ADDRESS="noreply@rails-base-example.herokuapp.com" NEW_RELIC_APP_NAME="Rails Base"
git push staging master
heroku run rake db:schema:load
heroku open
```

## Credits

Rails Base is maintained by [Timur Vafin](http://github.com/timurvafin).
It was written by [Flatstack](http://www.flatstack.com) with the help of our
[contributors](http://github.com/fs/rails-base/contributors).

[<img src="http://www.flatstack.com/logo.svg" width="100"/>](http://www.flatstack.com)
