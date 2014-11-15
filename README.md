# Skeleton for new Rails 4 based application

[![Build Status](https://semaphoreapp.com/api/v1/projects/31b68af8b073708a56e4e005bbcba2af4802816d/76140/shields_badge.png)](https://semaphoreapp.com/fs/rails-base)
[![Test Coverage](https://codeclimate.com/github/fs/rails-base/badges/coverage.svg)](https://codeclimate.com/github/fs/rails-base)
[![Code Climate](https://codeclimate.com/github/fs/rails-base.png)](https://codeclimate.com/github/fs/rails-base)



This simple application includes ruby/rails technology which we use in the FlatStack for new projects.
Application currently based on Rails 4 stable branch and Ruby 2.1.0

## Application gems:

* [Sass Rails](https://github.com/rails/sass-rails) Ruby on Rails stylesheet engine for Sass
* [Zurb Foundation for Rails](https://github.com/zurb/foundation-rails) the easiest way to use Foundation in your Rails app. For more information see [how to add Foundation to your Rails app](http://foundation.zurb.com/docs/applications.html)
* [Foundation Icon Fonts on SASS for Rails](https://github.com/zaiste/foundation-icons-sass-rails) for icons. Browse [icon set](http://zurb.com/playground/foundation-icon-fonts-3) examples
* [Autoprefixer](https://github.com/ai/autoprefixer-rails) for writing CSS without vendor prefixes
* [Slim](https://github.com/slim-template/slim) for views
* [Simple Form](https://github.com/plataformatec/simple_form) for forms
* [Decent Exposure](https://github.com/voxdolo/decent_exposure) for DRY controllers
* [Kaminari](https://github.com/amatsuda/kaminari) for pagination
* [Devise](http://github.com/plataformatec/devise) for basic auth
* [Rollbar](https://github.com/rollbar/rollbar-gem) for exception notification

## Development gems

* [Thin](https://github.com/macournoyer/thin) as rails web server
* [Foreman](https://github.com/ddollar/foreman) for managing development stack with Procfile
* [Letter Opener](https://github.com/ryanb/letter_opener) for preview mail in the browser instead of sending
* [Bullet](https://github.com/flyerhzm/bullet) gem to kill N+1 queries and unused eager loading
* [Rails Best Practices](https://github.com/railsbp/rails_best_practices) code metric tool
* [Brakeman](https://github.com/presidentbeef/brakeman) static analysis security vulnerability scanner
* [Pry Rails](https://github.com/rweng/pry-rails) is an alternative to the standard IRB shell for Ruby
* [Bundler Audit](https://github.com/rubysec/bundler-audit) Patch-level verification for Gems

## Testing gems

* Capybara, and Capybara Webkit for integration testing, including JavaScript behavior
* [Factory Girl](https://github.com/thoughtbot/factory_girl) for easier creation of test data
* [RSpec](https://github.com/rspec/rspec) for awesome, readable isolation testing
* [Shoulda Matchers](http://github.com/thoughtbot/shoulda-matchers) for frequently needed Rails and RSpec matchers
* [Email Spec](https://github.com/bmabey/email-spec) Collection of rspec matchers and cucumber steps for testing emails
* [Site Prism](https://github.com/natritmeyer/site_prism) for using Page Object in acceptance testing

## Initializes

* `01_config.rb` - shortcut for getting application config with `app_config`
* `mailer.rb` - setup default hosts for mailer from configuration
* `requires.rb` - automatically requires everything in lib/ & lib/extensions

## Scripts

* `bin/bootstrap` - setup required gems and migrate db if needed
* `bin/quality` - runs rubocop, brakeman, rails_best_practices and bundle-audit for the app
* `bin/ci` - should be used in the CI or locally
* `bin/server` - to run server locally

## Quick start

Clone application as new project with original repository named "rails-base"

    git clone git://github.com/fs/rails-base.git --origin rails-base [MY-NEW-PROJECT]


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

## How to update existing project with new changes from rails-base repo

You can fetch latest changes from rails-base repo and merge or cherry-pick commits

    git fetch rails-base
    git flow feature start rails-base-update
    git merge rails-base/master

    # fix conflicts
    # commit
    # test

    git flow feature finish rails-base-update

## Note on Patches/Pull Requests

* Fork the project.
* Make your feature addition or bug fix.
* Add tests for it. This is important so I don't break it in a future version unintentionally.
* Commit, do not mess with rakefile, version, or history.
  (if you want to have your own version, that is fine but bump version in a commit by itself I can ignore when I pull)
* Send a pull request. Bonus points for topic branches.

## Note on ie8 support

Rails Base fixes ie8 problems with:

* lack of support for rem units in CSS
* lack of media query support
* lack of Html5 and Css3 support

**In order to get rid of ie8 support please remove the following:**

* vendor/assets/javascripts/ie8 folder
* views/layouts/application lines commented with `/[if lt IE 9]`

        = javascript_include_tag "ie8/nwmatcher-1.2.5-min.js", "ie8/selectivizr-1.0.3b.js", "ie8/respond.min.js"
        = javascript_include_tag "ie8/rem"

## Note on how to override Zurb Foundation css properties

Do your overrides in the `app/assets/stylesheets/foundation_and_overrides.scss`

## Credits

Rails Base is maintained by [Timur Vafin](http://github.com/timurvafin).
It was written by [Flatstack](http://www.flatstack.com) with the help of our
[contributors](http://github.com/fs/rails-base/contributors).


[![Flatstack](https://avatars0.githubusercontent.com/u/15136?v=2&s=200)](http://www.flatstack.com)
