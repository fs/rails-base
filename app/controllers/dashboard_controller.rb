require 'github/markdown'

class DashboardController < ApplicationController
  def index
    @content = GitHub::Markdown.render(File.read("#{Rails.root}/README.md"))
  end
end
