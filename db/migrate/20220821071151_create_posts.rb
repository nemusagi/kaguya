class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string :title, null: false
      t.text :text
      t.integer :type, null: false
      t.boolean :is_published, null: false, default: false
      t.integer :genre, null: false
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  
  end
end
