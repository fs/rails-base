class CreateUserIdentities < ActiveRecord::Migration
  def self.up
    create_table :user_identities do |t|
      t.integer :user_id
      t.string :provider
      t.string :uid

      t.timestamps
    end

    add_index :user_identities, [:user_id]
  end

  def self.down
    drop_table :user_identities
  end
end
