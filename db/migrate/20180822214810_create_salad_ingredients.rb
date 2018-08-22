class CreateSaladIngredients < ActiveRecord::Migration[5.0]
  def change
    create_table :salad_ingredients do |t|
      t.integer :salad_id
      t.integer :ingredient_id
    end
  end
end
