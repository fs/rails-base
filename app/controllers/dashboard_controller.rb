require 'rdoc'

class DashboardController < ApplicationController
  def index
    @rdoc = RDoc::Markup::ToHtml.new.convert(File.read(File.join(Rails.root, 'doc', 'README_FOR_APP_TEMPLATE.rdoc')))
  end
end
