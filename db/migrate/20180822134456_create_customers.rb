class CreateCustomers < ActiveRecord::Migration[5.0]
  def change
    create_table :customers do |t|
      t.string :name
      t.integer :total_spend
      t.integer :num_of_visits
    end
  end
end
