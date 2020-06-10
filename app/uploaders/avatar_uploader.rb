class AvatarUploader < Shrine
  MAX_AVATAR_FILE_SIZE = 5 * 1024 * 1024

  Attacher.validate do
    validate_size 1..MAX_AVATAR_FILE_SIZE
    validate_mime_type %w[image/jpeg image/png]
    validate_extension %w[jpg jpeg png]
  end
end
