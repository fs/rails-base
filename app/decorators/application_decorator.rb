class ApplicationDecorator < Draper::Decorator
  delegate :to_model

  def self.collection_decorator_class
    PaginatingDecorator
  end
end
