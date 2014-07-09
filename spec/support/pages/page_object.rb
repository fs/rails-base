class PageObject < SitePrism::Page
  class << self
    include Rails.application.routes.url_helpers
  end

  include Formulaic::Dsl
end
