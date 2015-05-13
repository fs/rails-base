class BasePresenter
  attr_reader :record
  private :record

  # active_model
  delegate :to_model, :to_key, :to_param, :to_partial_path, :errors,
    to: :record

  def initialize(record)
    @record = record
  end
end
