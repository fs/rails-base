require 'github/markdown'

class DashboardController < ApplicationController
  expose(:content) { GitHub::Markdown.render("#{Rails.root}/README.md") }

  def index
  end
end
