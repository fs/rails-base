class User
  class ParameterSanitizer < Devise::ParameterSanitizer
    SIGN_UP_PARAMS = %i[
      full_name
      email
      password
      password_confirmation
    ].freeze

    ACCOUNT_UPDATE_PARAMS = %i[
      full_name
      email
      avatar
      remove_avatar
      password
      password_confirmation
    ].freeze

    def initialize(*)
      super
      permit(:sign_up, keys: SIGN_UP_PARAMS)
      permit(:account_update, keys: ACCOUNT_UPDATE_PARAMS)
    end
  end
end
