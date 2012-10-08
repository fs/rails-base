Deploy with Chef Solo
=====================

Initial bootstrap
-----------------

* Make sure you've completed `bundle install`
* Edit the `site-cookbooks/application/recipes/default.rb` and setup attributes related to your application
* Setup key based authentication to the target host for example with `ssh-copy-id`
* Run `./bootstrap.sh user@hostname`. This installs chef on a given host and applies recipes to it.

Applying recipes
----------------

When you need to reapply recipes to the box use `./apply.sh user@hostname`.
This is also done by bootstrap script so you needn't doing this just after bootstrapping.

*Important*: This does not update recipes to new versions (think bundler's dependency management).

Updating recipes
----------------

When you need to update some recipes to new versions use `bundle exec librarian-chef update` and apply recipes as described above.


Doing changes manually
----------------------

For those of you more comfortable with running tools rather than scripts here are the commands to run:

* `bundle exec librarian-chef install` -- download cookbooks
* `cp -i nodes/default.json nodes/HOST.json` -- place default runlist in place (you needn't tweak it)
* `bundle exec knife prepare user@host` -- install chef
* `bundle exec knife cook user@host` -- apply recipes to the target host
