class CreateSocialLink < ActiveRecord::Migration
  def change
    create_table :social_links do |t|
      t.integer :user_id, null: false
      t.string :provider, null: false
      t.string :uid, null: false
    end
  end
end
