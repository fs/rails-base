# Skeleton for new Rails 3 based application

[<img src="https://secure.travis-ci.org/fs/rails3-base.png"/>](http://travis-ci.org/fs/rails3-base)
[<img src="https://gemnasium.com/fs/rails3-base.png" alt="Dependency Status" />](https://gemnasium.com/fs/rails3-base)

This simple application includes ruby/rails technology which we use in the FlatStack for new projects.
Application currently based on Rails 3.2 stable branch and Ruby 1.9

## Application gems:

* [Less Rails](https://github.com/metaskills/less-rails) dynamic stylesheet language for asset pipeline
* [Less Rails Bootstrap](https://github.com/metaskills/less-rails-bootstrap) for styling app with Twiter Bootstrap
* [Slim](https://github.com/stonean/slim) for views
* [Simple Form](https://github.com/plataformatec/simple_form) for forms
* [Decent Exposure](https://github.com/voxdolo/decent_exposure) for DRY controllers
* [Kaminari](https://github.com/amatsuda/kaminari) for pagination
* [Devise](http://github.com/plataformatec/devise) for basic auth
* [Airbrake](https://github.com/airbrake/airbrake) for exception notification

## Development gems

* [Thin](https://github.com/macournoyer/thin) as rails web server
* [Foreman](https://github.com/ddollar/foreman) for managing development stack with Procfile
* [Letter Opener](https://github.com/ryanb/letter_opener) for preview mail in the browser instead of sending
* [Mail Safe](https://github.com/myronmarston/mail_safe) keep ActionMailer emails from escaping into the wild during development
* [Bullet](https://github.com/flyerhzm/bullet) gem to kill N+1 queries and unused eager loading
* [Rails Best Practices](https://github.com/railsbp/rails_best_practices) code metric tool
* [Brakeman](https://github.com/presidentbeef/brakeman) static analysis security vulnerability scanner

## Testing gems

* Turnip, Capybara, and Capybara Webkit for integration testing, including JavaScript behavior
* [Factory Girl](https://github.com/thoughtbot/factory_girl) for easier creation of test data
* [RSpec](https://github.com/rspec/rspec) for awesome, readable isolation testing
* [Shoulda Matchers](http://github.com/thoughtbot/shoulda-matchers) for frequently needed Rails and RSpec matchers
* [Email Spec](https://github.com/bmabey/email-spec) Collection of rspec matchers and cucumber steps for testing emails


## Initializes

* `01_config.rb` - shortcut for getting application config with `app_config`
* `mailer.rb` - setup default hosts for mailer from configuration
* `time_formats.rb` - setup default time formats, so you can use them like object.create_at.to_s(:us_time)
* `requires.rb` - automatically requires everything in lib/ & lib/extensions

## Scripts

* `script/bootstrap` - setup required gems and migrate db if needed
* `script/quality` - runs brakeman and rails_best_practices for the app
* `script/ci` - should be used in the CI, checkout .travis.yml for example
* `script/ci_deploy` - should be used in [Semaphoreapp CI to deploy code to Heroku](http://tatsoft.ru/ci-semaphoreapp)

## Quick start

Clone application as new project with original repository named "rails3-base"

    git clone git://github.com/fs/rails3-base.git --origin rails3-base [MY-NEW-PROJECT]


Create your new repo on GitHub and push master into it.
Make sure master branch is tracking origin repo.

    git remote add origin git@github.com:[MY-GITHUB-ACCOUNT]/[MY-NEW-PROJECT].git
    git push -u origin master

Run bootstrap script

    script/bootstrap

Make sure all test are green

    bundle exec rspec spec

Run app

    foreman start

## How to update existing project with new changes from rails3-base repo

You can fetch latest changes from rails3-base repo and merge or cherry-pick commits

    git fetch rails3-base
    git flow feature start rails3-base-update
    git merge rails3-base/master

    # fix conflicts
    # commit
    # test

    git flow feature finish rails3-base-update

## Note on Patches/Pull Requests

* Fork the project.
* Make your feature addition or bug fix.
* Add tests for it. This is important so I don't break it in a future version unintentionally.
* Commit, do not mess with rakefile, version, or history.
  (if you want to have your own version, that is fine but bump version in a commit by itself I can ignore when I pull)
* Send a pull request. Bonus points for topic branches.
