# Change Log

## Unreleased

- Add [Gaffe](https://github.com/mirego/gaffe) to handle Rails error pages in a clean, simple way
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
