class CreateUsers < ActiveRecord::Migration[8.0]
  def change
    create_table :users do |t|
      t.string :email_address, null: false, index: { unique: true }
      t.string :password_digest, null: false
      t.string :name, limit: 34
      t.string :slug, null: false, index: { unique: true }
      t.text :bio
      t.integer :role, null: false

      t.timestamps
    end
  end
end
