class DropRecipes < ActiveRecord::Migration[5.2]
  def up
    drop_table :recipes
  end

  def down
    create_table "recipes", force: :cascade do |t|
      t.string "uri_id"
      t.string "title"
      t.string "image"
      t.string "source"
      t.string "url"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
    end
  end
end
