# Rails Base

[![Build Status](https://flatstack.semaphoreci.com/badges/rails-base.svg?key=1e8f53ac-b0b4-4dc7-bf8b-8027aa5a609e)](https://flatstack.semaphoreci.com/projects/rails-base)

Rails Base is the base Rails application template used at Flatstack.
It's based on Rails 6 and Ruby 2.7

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
* [Action Policy](https://github.com/palkan/action_policy) to encapsulate authorization logic
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
* [ByeBug](https://github.com/deivid-rodriguez/byebug) as debugger
* [Bundler Audit](https://github.com/rubysec/bundler-audit) for scanning the Gemfile for
  insecure dependencies based on published CVEs
* [Spring](https://github.com/rails/spring) for fast Rails actions via
  pre-loading
* [Web Console](https://github.com/rails/web-console) for better debugging via
  in-browser IRB consoles
* [SCSS-Lint](https://github.com/brigade/scss-lint) for reporting violations of SCSS coding conventions
* [Slim-Lint](https://github.com/sds/slim-lint) for reporting violations of Ruby style guide in `.slim` templates
* [Rails ERD](https://github.com/voormedia/rails-erd) for generating a diagram based on application's AR models

## Testing Gems

* [Capybara](https://github.com/jnicklas/capybara) for integration testing
* [Factory Bot](https://github.com/thoughtbot/factory_bot_rails) for test data
* [RSpec](https://github.com/rspec/rspec) for unit testing
* [Shoulda Matchers](http://github.com/thoughtbot/shoulda-matchers) for common RSpec matchers
* [Email Spec](https://github.com/bmabey/email-spec) for common matchers for testing emails

## Initializers

* `mailer.rb` - setup default hosts for mailer from configuration
* `requires.rb` - automatically requires everything in lib/ & lib/extensions

## Scripts

* `bin/setup` - setup required gems and migrate db if needed
* `bin/quality` - runs rubocop, brakeman, rails_best_practices and bundle-audit for the app
* `bin/test` - runs all tests and quality checks
* `bin/server` - to run server locally

## Getting Started

### Prepare dependencies

Some gems have native extensions.
You should have GCC installed on your development machine.
Dependencies will be automatically installed via setup script.

* `phantomjs` - to run Javascript unit tests
* `graphviz` - to generate Entity-Relationship Diagram
* `node` - JavaScript runtime

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
  bin/test
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

### Custom Server

To be able to deploy to your custom server [Cloud66.com](http://cloud66.com) recommended as a provisioning and deployment service.
Make sure to review and configure `cloud66/manifest.yml` before deployment.

## Credits

Rails Base is maintained by [Timur Vafin](http://github.com/timurvafin).
It was written by [Flatstack](http://www.flatstack.com) with the help of our
[contributors](http://github.com/fs/rails-base/contributors).

[<img src="http://www.flatstack.com/logo.svg" width="100"/>](http://www.flatstack.com)
