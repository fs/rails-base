# Summary

A brief description of the pull request.

https://www.pivotaltracker.com/story/show/[story-id]

# Test plan

List of steps to manually test introduced functionality:

* Go to Application
* Sign in
* ...

# Review notes

While reviewing pull-request (especially when it's your pull-request),
please make sure that:

- you understand what problem is solved by PR and how is it solved
- new tests are in place, no redundant tests
- DB schema changes reflect new migrations
- newly introduces DB fields have indexes and constraints
- routes are RESTful, no useless routes
- there are no missed files (migrations, view templates)
- required ENV variables added and described in `.env.example` and added to Heroku
- associated Heroku review app works correctly with introduced changes

# Deploy notes

Notes regarding deployment the contained body of work.
These should note any db migrations, ENV variables, services, etc.
