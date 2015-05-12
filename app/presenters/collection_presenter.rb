class CollectionPresenter
  include Enumerable

  attr_reader :collection
  private :collection

  cattr_accessor :presenter
  self.presenter = BasePresenter

  # partial rendering
  alias_method :to_ary, :to_a

  # pagination
  delegate :current_page, :total_pages, :limit_value, :entry_name, :total_count, :offset_value, :last_page?,
    to: :collection

  def initialize(collection)
    @collection = collection
  end

  def each
    collection.each { |item| yield(presenter.new(item)) }
  end
end
