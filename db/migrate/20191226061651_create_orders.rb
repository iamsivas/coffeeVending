class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.string :item_name
      t.integer :water
      t.integer :coffee
      t.integer :sugar
      t.integer :milk

      t.timestamps
    end
  end
end
