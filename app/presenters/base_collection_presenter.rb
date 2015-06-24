class BaseCollectionPresenter
  include Enumerable

  attr_reader :collection, :presenter
  private :collection, :presenter

  # partial rendering
  alias_method :to_ary, :to_a

  # pagination
  delegate :current_page, :total_pages, :limit_value, :entry_name, :total_count, :offset_value, :last_page?,
    to: :collection

  def initialize(collection, presenter = nil)
    @collection = collection
    @presenter = presenter || infer_presenter
  end

  def each
    collection.each { |item| yield(presenter.new(item)) }
  end

  private

  def infer_presenter
    self.class.name.gsub("sPresenter", "Presenter").constantize
  end
end
