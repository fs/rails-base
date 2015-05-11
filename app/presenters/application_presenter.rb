class ApplicationPresenter
  include Enumerable

  attr_reader :record, :collection
  private :record, :collection

  # active_model
  delegate :to_model, :to_key, :to_param, :to_partial_path,
    to: :record

  # partial rendering
  delegate :to_ary,
    to: :collection, allow_nil: true

  # pagination
  delegate :current_page, :total_pages, :limit_value, :entry_name, :total_count, :offset_value, :last_page?,
    to: :collection

  def initialize(record_or_collection)
    if record_or_collection.respond_to?(:each)
      @collection = record_or_collection
    else
      @record = record_or_collection
    end
  end

  def each
    collection.each { |item| yield(new(item)) }
  end
end
