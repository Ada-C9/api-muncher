class AddImageToFavorite < ActiveRecord::Migration[5.2]
  def change
    add_column :favorites, :image, :string
  end
end
