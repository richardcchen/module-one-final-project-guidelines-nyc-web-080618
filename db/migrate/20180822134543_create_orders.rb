class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.float :total
      t.date :date_of_order
      t.integer :customer_id
      t.integer :store_id
    end
  end
end
