class CreateSocialProfiles < ActiveRecord::Migration
  def change
    create_table :social_profiles do |t|
      t.references :user, index: true
      t.string :provider, index: true, null: false, default: ""
      t.string :uid, index: true, null: false, default: ""
    end
  end
end
