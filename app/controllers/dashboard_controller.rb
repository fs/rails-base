require 'github/markdown'

class DashboardController < ApplicationController
  expose(:content) { GitHub::Markdown.render(File.read(File.join(Rails.root, 'doc', 'README_TEMPLATE.md'))) }

  def index
  end
end
