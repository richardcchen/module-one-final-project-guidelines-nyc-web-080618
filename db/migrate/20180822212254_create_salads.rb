class CreateSalads < ActiveRecord::Migration[5.0]
  def change
    create_table :salads do |t|
      t.string :name
      t.integer :price
    end
  end
end
