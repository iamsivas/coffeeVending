class CreateAvailabilities < ActiveRecord::Migration[6.0]
  def change
    create_table :availabilities do |t|
      t.string :item_name
      t.integer :count
    end
  end
end
