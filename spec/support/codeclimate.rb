if ENV["CI"]
  require "codeclimate-test-reporter"
  CodeClimate::TestReporter.start
end
