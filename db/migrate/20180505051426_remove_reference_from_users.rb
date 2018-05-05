class RemoveReferenceFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_reference :users, :recipe, foreign_key: true
  end
end
