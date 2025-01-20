class CreateIdentities < ActiveRecord::Migration[8.0]
  def change
    create_table :identities do |t|
      t.string :provider_uid, null: false
      t.string :provider_name, null: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
