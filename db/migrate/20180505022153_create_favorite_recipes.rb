class CreateFavoriteRecipes < ActiveRecord::Migration[5.2]
  def change
    create_table :favorite_recipes do |t|
      t.string :label
      t.string :image
      t.string :source
      t.string :uri
      t.string :url

      t.timestamps
    end
  end
end
