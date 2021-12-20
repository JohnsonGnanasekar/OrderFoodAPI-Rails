class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.integer :customer_id, null: false
      t.decimal :cost, null: false
      t.timestamps
    end
  end
end
