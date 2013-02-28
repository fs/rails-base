# Unreleased

* Dropin git flow support, master will be the main branch
* Update Rails to 3.2.12
* Update json to 1.7.7

# 0.3.3

* Update devise to 2.2.3
* Update bullet to 4.3.0
* Update dotenv to 0.5.0.
* Update factory_girl_rails to 4.2.0
* Update foreman to 0.61.0
* Update jquery-rails to 2.2.0
* Update slim to 1.3.6, slim-rails to 1.1.0
* Update debugger to 1.3.0
* Update RBP config
* Add user@example.com to seed.rb

# 0.3.2

* Update Rails to 2.3.11
* Update code metrics gems


# 0.3.1

* Update Rails to 2.3.9 and other gems to latests versions. See git log.

# 0.3

* Replace cucumber with turnip
* Add script/ci_deploy
* Remove rails3-generators
* Add script/bootstrap
* Add airbrake
* Add bullet
* Add letter_opener
* Add twitter bootstrap, need to clean up more for scaffold
* Removed bourbon
* SCSS replaced with less-twitter-bootstrap
* Update simple_form to 2.0
* Rails updated to 3.2.8
* Devise updated to 2.0
* Configatron replaced with native Rails.application.config, checkout config/initializers/config.rb
* Replaced inherited resources with decent_exposure
* Removed tabletastic

# 0.2

* Ruby 1.9
* Rails 3.2
* Slim for views
* New nice styling with scss
* SimpleForm instead of FormTastic
* Configatron for configuration
* Cucumber steps without web_steps
* Added rails_best_practices
* Added bourbon
* Added brakeman
* Added mail_safe
* Removed OmniAuth
* Replaced flutie gem with styleguides (only /styleguides support)
* Removed cached gems
* Removed VCR

# 0.1.4

* Auto validates length of field extracted to https://gist.github.com/907485

# 0.1.3

* Reorganize cucumber features by user roles

# 0.1.2

* Cleanup application.css

# 0.1.1

* Updated Rails to 3.0.6
* Other small fixes

# 0.1

* We now use bundler package and bundler install --path vendor --local instead of RVM gemset, so all required gems
are in the repo.
* Kaminari instead of will_paginate
* Client side validation added
* New styles for sign in and sign up
* Added parallel_test gem for running test more then one CPU core
* Updated gems to the latest
