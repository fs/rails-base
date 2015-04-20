class ModelPresenter
  # ActiveModel compatibility
  delegate :to_model, :to_key, :to_param, :to_partial_path, to: :@record

  def initialize(record)
    @record = record
  end
end
