Deploy with Chef Solo
=====================

* Make sure you've completed `bundle install`
* Edit the `site-cookbooks/application/recipes/default.rb`
* Run `./bootstrap.sh user@hostname`. This installs chef on a given host and applies recipes to it.
* Use `./apply.sh user@hostname` when you need to reapply recipes. This is the same as bootstrap but doesn't reinstall chef itself.


For those of you more comfortable with running tools rather than scripts here is the commands to run:

* `bundle exec librarian-chef install` -- download cookbooks
* `cp -i nodes/default.json nodes/HOST.json` -- place default runlist in place (you needn't tweak it)
* `bundle exec knife prepare user@host` -- install chef
* `bundle exec knife cook user@host` -- apply recipes to the target host
