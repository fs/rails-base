class UsersRepository
  def find(id, attributes: nil)
    users.only(attributes).where(id: id).first
  end

  def find_by_email(email, attributes: nil)
    users.only(attributes).where(email: email).first
  end

  def all(attributes: nil)
    users.only(attributes)
  end

  def update(user, attrs = {})
    user.update(attrs)
  end

  private

  def users
    @users ||= User.all
  end
end
