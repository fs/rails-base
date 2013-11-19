require 'github/markdown'

class DashboardController < ApplicationController
  expose(:content) do
    GitHub::Markdown.render(File.read("#{Rails.root}/README.md"))
  end

  def index
  end
end
