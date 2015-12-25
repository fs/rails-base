RSpec::Matchers.define :have_connected_account do |social_profile|
  match do
    within ".js-social-profiles" do
      have_text(social_profile)
    end
  end
end
