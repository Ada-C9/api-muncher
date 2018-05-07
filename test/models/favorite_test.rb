require "test_helper"

describe Favorite do
  describe 'relations' do
    it 'associates a user and a user_id' do
      user = users(:one)

      favorite = Favorite.create!(name: 'Teriyaki Chicken', uri: 'http://www.recipe.com/12345', user_id: user.id, image: "https://www.edamam.com/web-img/262/262b4353ca25074178ead2a07cdf7dc1.jpg")

      favorite.user_id.must_equal users(:one).id
    end
  end
end
