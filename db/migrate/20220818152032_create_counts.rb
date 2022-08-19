class CreateCounts < ActiveRecord::Migration[6.0]
  def change
    create_table :counts do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :counts, null: false, default: 0
      t.timestamps
    end
  end
end
