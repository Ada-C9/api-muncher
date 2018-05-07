require "test_helper"

describe FavoritesController do
  describe 'logged in user' do
    describe 'create' do
      before do
        @favorite_count = Favorite.count
      end

      it 'creates a new favorite with appropriate information' do
        login(users(:one))

        recipe_data = {
          name: 'Teriyaki Chicken',
          uri: 'www.goodfood.com',
          image: 'www.goodfood.com/image/1'
        }

        post favorites_path, params: recipe_data

        must_respond_with :success
        Favorite.count.must_equal @favorite_count + 1
      end

      it 'redirects a guest user' do
        recipe_data = {
          name: 'Teriyaki Chicken',
          uri: 'www.goodfood.com',
          image: 'www.goodfood.com/image/1'
        }

        post favorites_path, params: recipe_data

        must_respond_with :redirect
        Favorite.count.must_equal @favorite_count
      end
    end # create
  end # logged in user
end # FavoritesController
