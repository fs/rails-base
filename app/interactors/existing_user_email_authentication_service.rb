class ExistingUserEmailAuthenticationService
  def initialize(auth)
    @auth = auth
  end

  def call
    user = find_user_by_email

    user
  end

  def find_user_by_email
    email = @auth.extra.raw_info.email || @auth.info.email

    User.find_by_email(email)
  end
end
