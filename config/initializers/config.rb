configatron.configure_from_hash(YAML.load(File.read("#{Rails.root}/config/config.yml"))[Rails.env])
