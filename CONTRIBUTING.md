# Contributing

1. Fork the project.
2. Setup it on your machine with `bin/setup`.
3. Make sure the tests pass: `bin/ci`.
4. Make your change. Add tests for your change when necessary. Make the tests pass: `bin/ci`.
5. Mention your changes in "Unreleased" section of `CHANGELOG.md`
6. Push to your fork and [submit a pull request](https://help.github.com/articles/creating-a-pull-request/)
  (bonus points for topic branches).

## Releases

We release new versions of Rails Base fortnightly on Fridays.

We do not strictly follow [Semantic Versioning](http://semver.org/) as we use only `MAJOR`/`MINOR` increments:

* Increment the `MAJOR` version when you make incompatible API changes.
  For example, upgrading Rails from 3.x to 4.x.
* Increment the `MINOR` version when you make any other changes.
  That includes backwards-compatible changes and bug fixes.

When ready to release:

1. Make sure that tests are green.
2. Update the changelog with the new version and commit it with message "release <version>".
3. Tag the release by running `git tag v<version>`. Push the tag: `git push --tags`.
4. Verify that everything was pushed correctly on the Github: https://github.com/fs/rails-base/releases
