require "test_helper"

describe Favorite do
  describe 'relations' do
    it 'associates a user and a user_id' do
      user = users(:one)

      favorite = Favorite.create!(name: 'Teriyaki Chicken', uri: 'http://www.recipe.com/12345', user_id: user.id)

      favorite.user_id.must_equal users(:one).id
    end
  end
end
