module ApplicationHelper
  attr_accessor :show_title
  alias_method :show_title?, :show_title

  def title(page_title, show_title = true)
    self.show_title = show_title
    content_for(:title) { page_title.to_s }
  end
end
