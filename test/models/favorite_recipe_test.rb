require "test_helper"

describe FavoriteRecipe do
  let(:favorite_recipe) { FavoriteRecipe.new }

  it "must be valid" do
    value(favorite_recipe).must_be :valid?
  end
end
