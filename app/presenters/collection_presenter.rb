class CollectionPresenter
  include Enumerable

  # Pagination compatibility
  delegate :current_page, :total_pages, :limit_value, :entry_name, :total_count,
    :offset_value, :last_page?, to: :@collection

  cattr_accessor :presenter
  self.presenter = ModelPresenter

  def initialize(collection)
    @collection = collection
  end

  def each
    @collection.each { |item| yield(presenter.new(item)) }
  end
end
