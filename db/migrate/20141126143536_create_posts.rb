class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :text
      t.string :picture
      t.boolean :privacy

      t.timestamps
    end
  end
end
