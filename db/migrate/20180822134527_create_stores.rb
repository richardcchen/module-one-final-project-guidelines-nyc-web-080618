class CreateStores < ActiveRecord::Migration[5.0]
  def change
    create_table :stores do |t|
      t.string :name
      t.string :location
      t.integer :sales
      t.integer :customer_count
    end 
  end
end
