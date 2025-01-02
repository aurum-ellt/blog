class CreateSubscribers < ActiveRecord::Migration[8.0]
  def change
    create_table :subscribers, primary_key: %i[ email_address user_id ] do |t|
      t.string :email_address, null: false
      t.references :user, null: false, foreign_key: true
      t.string :token, null: false
      t.boolean :confirmed, null: false, default: false

      t.timestamps
    end

    add_index :subscribers, :token, unique: true
  end
end
