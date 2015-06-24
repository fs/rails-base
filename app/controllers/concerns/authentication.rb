module Authentication
  extend ActiveSupport::Concern

  included do
    helper do
      def current_user
        UserPresenter.new(warden.authenticate(scope: :user))
      end
    end
  end

  private

  def devise_parameter_sanitizer
    if resource_class == User
      User::ParameterSanitizer.new(User, :user, params)
    else
      super
    end
  end
end
