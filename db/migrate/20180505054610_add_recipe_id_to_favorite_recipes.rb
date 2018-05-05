class AddRecipeIdToFavoriteRecipes < ActiveRecord::Migration[5.2]
  def change
    add_column :favorite_recipes, :recipe_id, :string
  end
end
