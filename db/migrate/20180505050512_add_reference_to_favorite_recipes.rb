class AddReferenceToFavoriteRecipes < ActiveRecord::Migration[5.2]
  def change
    add_reference :favorite_recipes, :user, foreign_key: true
  end
end
