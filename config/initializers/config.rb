APP_CONFIG = YAML.load(File.read("#{Rails.root}/config/config.yml"))[Rails.env]
