# Use AWS S3 as Refile backend for all environments except test
unless Rails.env.test?
  require "refile/s3"

  aws = {
    access_key_id: ENV["S3_ACCESS_KEY"],
    secret_access_key: ENV["S3_SECRET_KEY"],
    region: ENV["S3_REGION"],
    bucket: ENV["S3_BUCKET"]
  }

  Refile.cache = Refile::S3.new(prefix: "cache", **aws)
  Refile.store = Refile::S3.new(prefix: "store", **aws)
end

# Attach Refile backend to specific host if specified
# Is must have option for production ready applications
# https://github.com/refile/refile#3-rack-application
Refile.host = ENV["USER_ASSETS_HOST"] if ENV["USER_ASSETS_HOST"]
