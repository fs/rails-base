module Authorization
  extend ActiveSupport::Concern

  included do
    rescue_from ActionPolicy::Unauthorized, with: :user_not_authorized
  end

  private

  def user_not_authorized
    redirect_to(root_path)
  end
end
