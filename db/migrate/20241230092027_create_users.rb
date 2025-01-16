class CreateUsers < ActiveRecord::Migration[8.0]
  def change
    create_table :users do |t|
      t.string :email_address, null: false
      t.string :password_digest, null: false
      t.string :name, limit: 34
      t.string :slug, null: false
      t.text :bio

      t.timestamps

      t.index [ :email_address ], unique: true
      t.index [ :slug ], unique: true
    end
  end
end
