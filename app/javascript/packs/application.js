/* eslint no-console:0 */
import User from "../classes/user"

require("jquery")
require("@rails/ujs").start()

window.App = {}

App.currentUserData = JSON.parse(document.getElementsByTagName('body')[0].getAttribute('data-current-user'))

if (App.currentUserData) {
  App.currentUser = new User(App.currentUserData);
}
