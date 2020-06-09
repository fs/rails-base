require "shrine"
require "shrine/storage/file_system"
require "shrine/storage/s3"

Shrine.storages = {
  cache: Shrine::Storage::FileSystem.new("public", prefix: "uploads/cache"),
  store: Shrine::Storage::FileSystem.new("public", prefix: "uploads")
}

# s3 = Shrine::Storage::S3.new(
#   bucket: "my-app", # required
#   region: "eu-west-1", # required
#   access_key_id: "abc",
#   secret_access_key: "xyz",
# )

Shrine.plugin :activerecord
Shrine.plugin :cached_attachment_data
Shrine.plugin :restore_cached_data
