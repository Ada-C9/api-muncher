class CreateFavorites < ActiveRecord::Migration[5.2]
  def change
    create_table :favorites do |t|
      t.string :name
      t.string :uri
      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end
