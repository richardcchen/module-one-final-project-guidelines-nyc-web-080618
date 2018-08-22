class CreateOrderSalads < ActiveRecord::Migration[5.0]
  def change
    create_table :order_salads do |t|
      t.integer :salad_id
      t.integer :order_id
    end
  end
end
