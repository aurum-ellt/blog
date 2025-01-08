class CreateReportings < ActiveRecord::Migration[8.0]
  def change
    create_table :reportings do |t|
      t.string :url, null: false
      t.integer :category, null: false
      t.text :message

      t.timestamps
    end
  end
end
