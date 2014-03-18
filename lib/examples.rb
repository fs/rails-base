module Examples
  module_function

  def setup!
    FactoryGirl.create(:user, :confirmed)
  end
end
