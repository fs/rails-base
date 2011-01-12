class CreateUserIdentities < ActiveRecord::Migration
  def self.up
    create_table :user_identities do |t|
      t.integer :user_id
      t.string :provider
      t.string :uid

      t.timestamps
    end
  end

  def self.down
    drop_table :user_identities
  end
end
