class ActiveRecord::Base
  validate do |record|
    record.class.columns.select{|c| c.limit.present? }.each do |column|
      validator = ActiveModel::Validations::LengthValidator.new(:attributes => [column.name], :maximum => column.limit)
      validator.validate(record)
    end
  end
end
