class CreateSocialProfiles < ActiveRecord::Migration
  def change
    create_table :social_profiles do |t|
      t.references :user, index: true
      t.string :provider, index: true, null: false
      t.string :uid, index: true, null: false
    end
  end
end
