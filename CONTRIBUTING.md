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

When ready to release and specs are all green:

1. Update the changelog with the new version
2. Add corresponding git tag (`v1.1`)
