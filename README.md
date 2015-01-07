# Rails Base

[![Build Status](https://semaphoreapp.com/api/v1/projects/31b68af8b073708a56e4e005bbcba2af4802816d/76140/shields_badge.png)](https://semaphoreapp.com/fs/rails-base)
[![Test Coverage](https://codeclimate.com/github/fs/rails-base/badges/coverage.svg)](https://codeclimate.com/github/fs/rails-base)
[![Code Climate](https://codeclimate.com/github/fs/rails-base.png)](https://codeclimate.com/github/fs/rails-base)


Rails Base is the base Rails application template used at Flatstack.
It's based on Rails 4 and Ruby 2.1.5.


## Application Gems

* [Sass](https://github.com/rails/sass-rails) for Sass/Scss stylesheets
* [Zurb Foundation](https://github.com/zurb/foundation-rails) as CSS framework.
  For more information see [documentation on using Foundation in Rails apps](http://foundation.zurb.com/docs/applications.html)
* [Foundation Icon Font](https://github.com/zaiste/foundation-icons-sass-rails) for icons. Browse [icon set](http://zurb.com/playground/foundation-icon-fonts-3) examples
* [Autoprefixer](https://github.com/ai/autoprefixer-rails) for writing CSS without vendor prefixes
* [Slim](https://github.com/slim-template/slim) for views
* [Simple Form](https://github.com/plataformatec/simple_form) for forms
* [Decent Exposure](https://github.com/voxdolo/decent_exposure) to DRY controllers
* [Kaminari](https://github.com/amatsuda/kaminari) for pagination
* [Devise](http://github.com/plataformatec/devise) for basic auth
* [Rollbar](https://github.com/rollbar/rollbar-gem) for exception notification

## Development Gems

* [Thin](https://github.com/macournoyer/thin) as Rails web server
* [Foreman](https://github.com/ddollar/foreman) for managing development stack with Procfile
* [Letter Opener](https://github.com/ryanb/letter_opener) for opening mail in the browser instead of sending it
* [Bullet](https://github.com/flyerhzm/bullet) for detecting N+1 queries and unused eager loading
* [Rubocop](https://github.com/bbatsov/rubocop) for reporting violations of the Ruby style guide
* [Rails Best Practices](https://github.com/railsbp/rails_best_practices) for checking the code quality
* [Brakeman](https://github.com/presidentbeef/brakeman) for checking application for common security vulnerabilities
* [Pry Rails](https://github.com/rweng/pry-rails) for interactively exploring objects
* [Bundler Audit](https://github.com/rubysec/bundler-audit) for scanning the Gemfile for
  insecure dependencies based on published CVEs

## Testing Gems

* [Capybara](https://github.com/jnicklas/capybara) and [Capybara Webkit](https://github.com/thoughtbot/capybara-webkit)
  for integration testing, including JavaScript behavior
* [Factory Girl](https://github.com/thoughtbot/factory_girl) for test data
* [RSpec](https://github.com/rspec/rspec) for unit testing
* [Shoulda Matchers](http://github.com/thoughtbot/shoulda-matchers) for common RSpec matchers
* [Email Spec](https://github.com/bmabey/email-spec) for common matchers for testing emails
* [Site Prism](https://github.com/natritmeyer/site_prism) for using Page Object in acceptance testing

## Initializers

* `01_config.rb` - shortcut for getting application config with `app_config`
* `mailer.rb` - setup default hosts for mailer from configuration
* `requires.rb` - automatically requires everything in lib/ & lib/extensions

## Scripts

* `bin/bootstrap` - setup required gems and migrate db if needed
* `bin/quality` - runs rubocop, brakeman, rails_best_practices and bundle-audit for the app
* `bin/ci` - should be used in the CI or locally
* `bin/server` - to run server locally

## Getting Started

Clone application as new project with original repository named "rails-base"

    git clone --depth 1 git://github.com/fs/rails-base.git --origin rails-base [MY-NEW-PROJECT]

**Note: we use depth parameter here in order not to copy the history of changes in base project**

Create your new repo on GitHub and push master into it.
Make sure master branch is tracking origin repo.

    git remote add origin git@github.com:[MY-GITHUB-ACCOUNT]/[MY-NEW-PROJECT].git
    git push -u origin master

Run bootstrap script

    bin/bootstrap

Make sure all test are green

    bin/ci

Run app

    bin/server

**Do not forget to update this file!**

    mv doc/README_TEMPLATE.md README.md
    # update README.md
    git commit -am "Update README.md"

## Updating Existing Projects With New Changes From Rails Base

You can fetch latest changes from rails-base repo and merge or cherry-pick commits

    git fetch rails-base
    git flow feature start rails-base-update
    git merge rails-base/master

    # fix conflicts
    # commit
    # test

    git flow feature finish rails-base-update

## Overriding Foundation Settings

Do your overrides in the `app/assets/stylesheets/core/_foundation_and_overrides.scss`

## Credits

Rails Base is maintained by [Timur Vafin](http://github.com/timurvafin).
It was written by [Flatstack](http://www.flatstack.com) with the help of our
[contributors](http://github.com/fs/rails-base/contributors).


[![Flatstack](https://avatars0.githubusercontent.com/u/15136?v=2&s=200)](http://www.flatstack.com)
