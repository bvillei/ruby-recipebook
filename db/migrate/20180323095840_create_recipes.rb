class CreateRecipes < ActiveRecord::Migration[5.1]
  def change
    create_table :recipes do |t|
      t.references :user, foreign_key: true
      t.string :name
      t.string :category
      t.string :image
      t.string :ingredients
      t.string :description

      t.timestamps
    end
  end
end
