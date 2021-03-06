class CreateRecipe < ActiveRecord::Migration
  def change
    create_table :recipes do |table|
      table.string :title, null: false, unique: true
      table.text :body, null: false
      table.integer :servings 

      table.timestamps null: false
    end
  end
end
