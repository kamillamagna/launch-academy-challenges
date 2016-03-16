class CreateComment < ActiveRecord::Migration
  def change
    create_table :comments do |table|
      table.string :title, null: false
      table.text :body, null: false
      table.integer :recipe_id, null: false

      table.timestamps null: false
    end
  end
end
