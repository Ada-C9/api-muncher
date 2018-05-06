require 'test_helper'

require 'test_helper'

describe RecipeApiWrapper do
  describe 'list_recipes' do
    it 'gives a list of recipes' do

      VCR.use_cassette("recipes") do
        recipes = RecipeApiWrapper.list_recipes("chicken")

        recipes.each do |recipe|
          recipe.must_be_kind_of Recipe
        end
      end
    end

    it "can't give a list of recipes" do
      VCR.use_cassette("recipes") do
      recipe = RecipeApiWrapper.list_recipes("jdns2n")
      recipe['count'].must_equal 0
      response["error"].wont_be_nil
  end
end
  end

  describe 'show_recipe' do
    it 'gives a single recipe' do
      VCR.use_cassette("recipe") do
        recipe =
  end
end
