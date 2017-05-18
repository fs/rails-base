# Change Log

## Unreleased

- Remove `qt` from Brewfile and dependencies list
- Upgrade Ruby to 2.3.3, Nokogiri to 1.7.1
- Upgrade [decent exposure](https://github.com/hashrocket/decent_exposure) to 3.0
- Email previews for `DeviseMailer` at http://lvh.me:5000/rails/mailers
- Update foundation to 6 version
- Change csscomb & scss-lint configs
- Upgrade [rack-mini-profiler gem](https://github.com/MiniProfiler/rack-mini-profiler) to 0.10.1 to avoid [vulnerability](https://github.com/MiniProfiler/rack-mini-profiler/commit/4273771d65f1a7411e3ef5843329308d0e2d257c)
- Minor improvements in newrelick.yml
- Update Ruby to 2.3.1
- Update bin/setup script to clean old log files and tmp directory
- Update [nokogiri gem](https://github.com/sparklemotion/nokogiri)
- Update [rails_best_practices gem](https://github.com/railsbp/rails_best_practices)
- Update [email_spec gem](https://github.com/email-spec/email-spec) to avoid flaky specs based on encoded html entities
- Upgrade [rails](https://github.com/rails/rails) to 5.0.2, draper to 3.0.0.pre1
- Add [guard-rspec](https://github.com/guard/guard-rspec) to spead up TDD
- Add [bullet](https://github.com/flyerhzm/bullet) helper
- Replace [thetubyracer](https://github.com/cowboyd/therubyracer) with [mini-racer](https://github.com/discourse/mini_racer)
- Remove foreman and save logs to STDOUT
- Remove capybara-webkit and install [poltergeist](https://github.com/teampoltergeist/poltergeist)
- Remove [skim](https://github.com/appjudo/skim)

## 1.9 - 2016-04-22

- Introduce [Rspec-Its](https://github.com/rspec/rspec-its)
- Configure `.gitattributes` to avoid merge conflicts due to `CHANGELOG`
- Upgrade rubocop to 0.39.0, rubocop-rspec to 1.4.1, active_link_to to 1.0.3, faker to 1.6.3, slim_lint to 0.7.2

## 1.8 - 2016-03-22

- Upgrade Rails to 4.2.6, Ruby to 2.3.0, Rollbar to 2.8.3, Spring to 1.6.4
- Remove [fuubar](https://github.com/thekompanee/fuubar)
- Show 2 slowest specs during specs run [#415](https://github.com/fs/rails-base/pull/415) [#410](https://github.com/fs/rails-base/pull/410/files)
- Update [devise gem](https://github.com/plataformatec/devise)
- Removed wrong underfield hint on sign_up page
- Fix flash messages at new password and email confirmation sending
- Install [health_check](https://github.com/ianheggie/health_check)
- Fix alerts closing button on iOs devices
- Update [simple_form gem](https://github.com/plataformatec/simple_form)
- User factory generate confirmed user by default
- Update [nokogiri gem](https://github.com/sparklemotion/nokogiri)

## 1.7 - 2015-11-27

- Introduce [Draper](https://github.com/drapergem/draper) for presenting models into views
- Move Rack::MiniProfiler authorization to initializers
- Add ability to configure SMTP Mailer options not only with SendGrid via `config/initializers/mailer.rb`
- [Remove `app_config`](https://github.com/fs/rails-base/pull/342) shortcut and use `ENV` exclusively
- Turning on Partial Double Verification for Rspec
- Replace [rails_12factor](https://github.com/heroku/rails_12factor) with [rails_stdout_logging](https://github.com/heroku/rails_stdout_logging)
- Update [foundation-rails gem](https://github.com/zurb/foundation-rails)
- Update [rollbar gem](https://github.com/rollbar/rollbar-gem)
- Add gem [rack-mini-profiler](https://github.com/MiniProfiler/rack-mini-profiler) for displaying speed badge for every html page.
- Add configuration for [NewRelic](https://devcenter.heroku.com/articles/newrelic) Heroku-addon
- Implement the dynamic database name

## 1.6 - 2015-08-28

- Switch web server from [Thin](https://github.com/macournoyer/thin) to [Puma](https://github.com/puma/puma)
- Update [Uglifier](https://github.com/lautis/uglifier) version up to 2.7.2
- Add [Rubocop-Rspec](https://github.com/nevir/rubocop-rspec) for reporting violations of Ruby style guide in specs
- Add [Slim-Lint](https://github.com/sds/slim-lint) for reporting violations of Ruby style guide in `.slim` templates
- Update Ruby to 2.2.3
- Improve assets caching on Heroku: headers, gzipping, Cloudfront
- Move Rack::CanonicalHost and Rack::Auth::Basic configuration to initializers
- Support [Heroku Review Apps](https://devcenter.heroku.com/articles/github-integration#review-apps)
- Update [rails](https://github.com/rails/rails) version up to 4.2.3
- Add [Rails ERD](https://github.com/voormedia/rails-erd) gem for generating a diagram based on application's AR models

## 1.5 - 2015-08-14

- Replace [title](https://github.com/calebthompson/title) gem with [metamagic](https://github.com/lassebunk/metamagic)

## 1.4 - 2015-07-31

- Add gem [rack-canonical-host](https://github.com/tylerhunt/rack-canonical-host) for the definition a single host name as the canonical host for your application.
- Add Google Analytics
- Add ability to close app from unauthorized viewers, see: https://github.com/fs/rails-base/pull/302/files

## 1.3 - 2015-07-03

- Deprecate using i18n for submits, see: https://github.com/fs/rails-base/commit/ed4e55992e671cb3c9281cd10a4f5c26e7f1c02d
- Fix wrong titles and submit labels on devise pages after submit
- Fix `rails_best_practices` invocation from `bin/quality`, `config/rails_best_practices.yml` was ignored before.
- Introduce [CSSComb](https://github.com/csscomb/csscomb.js). For more details see: https://github.com/fs/rails-base/pull/284
- Add `Brewfile` to track application dependencies.

## 1.2 - 2015-06-19

- Update the following gems: `rails`, `jquery-rails`, `rack`, `web-console`. It fixes the security vulnerabilities, see http://weblog.rubyonrails.org/2015/6/16/Rails-3-2-22-4-1-11-and-4-2-2-have-been-released-and-more/

## 1.1 - 2015-06-05

- Add [Coffeelint](https://github.com/zmbush/coffeelint-ruby) to keep Coffeescript code clean and consistent
- Force double quotes everywhere: SCSS, Ruby. For more details see: https://github.com/fs/rails-base/pull/274
- Add [SCSS-Lint](https://github.com/brigade/scss-lint) for reporting violations of SCSS coding conventions
- Style Kaminari pagination to make it look like [Foundation's pagination](http://foundation.zurb.com/docs/v/4.3.2/components/pagination.html)
- Add [Spring](https://github.com/rails/spring) for fast Rails actions via pre-loading

## 1.0 - 2015-05-18

- Upgrade Ruby to 2.2.2
- Upgrade Rails to 4.2.1
