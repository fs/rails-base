class BasePresenter
  attr_reader :record
  private :record

  # active_model
  delegate :to_model, to: :record

  def initialize(record)
    @record = record
  end
end
