class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :title
      t.text :description
      t.decimal :price, default: 0.00

      t.timestamps null: false
    end
  end
end
