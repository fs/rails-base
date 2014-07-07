# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
Rails.application.config.assets.precompile += %w(
  vendor/modernizr.js
  ie8/nwmatcher-1.2.5-min.js
  ie8/selectivizr-1.0.3b.js
  ie8/respond.min.js
  ie8/rem.js
)
