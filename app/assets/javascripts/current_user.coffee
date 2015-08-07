class User
  constructor: (@data = {}) ->

  get: (param) ->
    @data[param]

  isSignedIn: ->
    @get("id")?

App.currentUser = new User(App.currentUserData)
