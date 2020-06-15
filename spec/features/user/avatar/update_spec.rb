require "rails_helper"

feature "Update Avatar" do
  include_context "when current user signed in"

  scenario "User updates it's avatar" do
    visit edit_user_registration_path(current_user)

    attach_file :user_avatar, Rails.root.join("spec", "support", "fixtures", "avatar.jpg")
    click_on "Update"

    expect(current_user.reload.avatar).to be_an_instance_of(AvatarUploader::UploadedFile)
  end

  scenario "User removes it's avatar" do
    current_user.avatar = File.open(Rails.root.join("spec", "support", "fixtures", "avatar.jpg"))
    current_user.save

    visit edit_user_registration_path(current_user)
    page.check "Remove avatar"
    click_on "Update"

    expect(current_user.reload.avatar).to be_nil
  end
end
