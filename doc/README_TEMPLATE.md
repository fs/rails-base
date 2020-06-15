# Project name

Third-party service badges (if available)

[![Build Status](https://flatstack.semaphoreci.com/badges/rails-base.svg?key=1e8f53ac-b0b4-4dc7-bf8b-8027aa5a609e)](https://flatstack.semaphoreci.com/projects/rails-base)

## Project description

Some short project description. Link to Basecamp project will be fine too.

## Dependencies

* PostgreSQL
* Ruby >= 2.7.1
* Rails >= 6.0.3.1

Setup required dependencies from `Brewfile`:
```bash
brew tap Homebrew/bundle
brew bundle
```

## Quick Start

```bash
# clone repo
git clone git@github.com:account/repo.git
cd repo

# run setup script
bin/setup

# configure ENV variables in .env
vim .env

# run server on 5000 port
bin/server
```

## Scripts

* `bin/setup` - setup required gems and migrate db if needed
* `bin/quality` - run brakeman and rails_best_practices for the app
* `bin/ci` - should be used in the CI to run specs

## Staging

* http://fs-rails-base.herokuapp.com

## Production

* http://fs-rails-base.herokuapp.com
