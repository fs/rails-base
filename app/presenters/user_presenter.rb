class UserPresenter < ApplicationPresenter
  # Devise compability
  delegate :is_a?, to: :record
  delegate :email, :full_name, to: :record

  def full_name_with_email
    "#{record.full_name} (#{record.email})"
  end
end
