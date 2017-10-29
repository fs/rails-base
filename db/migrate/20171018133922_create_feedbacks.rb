class CreateFeedbacks < ActiveRecord::Migration[5.0]
  def change
    create_table :feedbacks do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.text :text, null: false

      t.timestamps
    end
  end
end
