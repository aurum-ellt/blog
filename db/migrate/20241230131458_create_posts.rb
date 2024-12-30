class CreatePosts < ActiveRecord::Migration[8.0]
  def change
    create_table :posts do |t|
      t.string :slug, null: false
      t.string :title, limit: 89, null: false
      t.text :body
      t.integer :status, null: false
      t.boolean :broadcasted, null: false, default: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
    add_index :posts, :slug, unique: true
  end
end
