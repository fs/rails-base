module FixturesHelper
  def sanitize_fixture(record)
    if record.respond_to?(:map)
      record.map { |el| sanitize_string(el) }
    else
      sanitize_string(record)
    end
  end

  def sanitize_string(string)
    string.gsub(/[^\w\s]/, "")
  end
end
