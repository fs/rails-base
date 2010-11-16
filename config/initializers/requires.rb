# Require recursively all files in the lib/extensions
Dir[Rails.root.join('lib/extensions/**/*.rb')].each {|f| require f}

# Require only files placed in the lib folder
Dir[Rails.root.join('lib/*.rb')].each {|f| require f}
