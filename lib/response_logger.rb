class ResponseLoggerMiddleware
  RESPONSE_LOG_DIR = Rails.root.join("log", "responses")
  FileUtils.rm_rf(Dir.glob(RESPONSE_LOG_DIR)) if Dir.exist?(RESPONSE_LOG_DIR)
  Dir.mkdir(RESPONSE_LOG_DIR)

  def initialize(app)
    @app = app
  end

  def call(env)
    response = @app.call(env)
    log(response)
    response
  end

  def log(rack_response)
    _code, _headers, response = rack_response

    if response.respond_to?(:body)
      html = response.body
      filename = "response_#{Time.now.to_f}.html"
      File.open(RESPONSE_LOG_DIR.join(filename), "wb") do |file|
        file.puts(html)
      end
    end
  end
end
