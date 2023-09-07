class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.references :vendor, null: false, foreign_key: true
      t.string :name
      t.string :brand_name

      t.timestamps
    end
  end
end
