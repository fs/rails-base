class UserMailer < Devise::Mailer
  private

  def initialize_from_record(record)
    super
    @resource = UserPresenter.new(@resource)
  end
end
