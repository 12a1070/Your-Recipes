class CreateRecipes < ActiveRecord::Migration[7.0]
  def change
    create_table :recipes do |t|
      t.string :photo
      t.string :title, null: false
      t.text :material, null: false
      t.text :process, null: false
      t.integer :cooking_minute
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
