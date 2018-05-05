class FavoriteRecipe < ApplicationRecord
  belongs_to :user
  validates :recipe_id, presence: true, uniqueness: true
end
