class CreateOrderProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :order_products do |t|
      t.integer :order_id, null: false
      t.integer :product_id, null: false
      t.integer :qty, null: false, :default => 1
      t.timestamps
    end
  end
end
