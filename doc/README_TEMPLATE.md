Project name
-

CI badge (if available)
[<img src="https://semaphoreapp.com/api/v1/projects/31b68af8b073708a56e4e005bbcba2af4802816d/76140/badge.png"/>](https://semaphoreapp.com/projects/2742)

Project description.

Dependencies
-

Information about external dependencies (redis, mongo, postgres, etc) and how you can obtain them (via homebrew, apt-get or from ftp).

Information about ruby and rails versions.

- PostgreSQL 9.2.4
  - `brew install postgres`
- Ruby 2.0.0-p247
  - `rbenv install 2.0.0-p247`
- Rails 3.2.12

Quick Start
-

Clone this repo:

```
git clone git@github.com:account/repo.git
cd repo
```

Run bootstrap script

```
bin/bootstrap
```

Initializers
-

* `01_config.rb` - shortcut for getting application config with `app_config`
* `mailer.rb` - setup default hosts for mailer from configuration
* `time_formats.rb` - setup default time formats, so you can use them like object.create_at.to_s(:us_time)
* `requires.rb` - automatically requires everything in lib/ & lib/extensions

Scripts
-

* `bin/bootstrap` - setup required gems and migrate db if needed
* `bin/quality` - run brakeman and rails_best_practices for the app
* `bin/ci` - should be used in the CI to run specs

Documentation & Examples
-

Where is documentation and examples (e.g. `./docs`)?

Continuous Integration
-

CI service info and status (if available).
Add a link to a project page on [Semaphore](http://semaphoreapp.com).

Staging
-

Location and other info about staging servers.

Production
-

Location and other info about production servers.

Third-party services
-

Code Climate, etc

Workflow
-

Information about base branch, branch naming, commit messages, specs and pull requests. Check out our [guides](https://github.com/fs/guides/tree/master/development/maintain-existing-project/workflow).
