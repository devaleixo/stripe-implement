class CreateTeddies < ActiveRecord::Migration[7.0]
  def change
    create_table :teddies do |t|
      t.string :name
      t.references :category, null: false, foreign_key: true
      t.string :photo_url

      t.timestamps
    end
  end
end
