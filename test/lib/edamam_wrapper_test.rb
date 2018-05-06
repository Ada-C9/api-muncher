require 'test_helper'

describe EdamamWrapper do
  describe 'search_recipes' do
    it "gives a list of recipes" do
      VCR.use_cassette('recipes') do
        recipes = EdamamWrapper.search_recipes("brains")

        recipes.each do |recipe|
          recipe.must_be_kind_of Recipe
        end
      end
    end
  end

  describe 'get_recipe' do
    it "retrieves a specific recipe" do
      VCR.use_cassette('recipes') do
        recipes = EdamamWrapper.search_recipes("brains")
        recipe = recipes.first

        first_recipe = EdamamWrapper.get_recipe(recipe.id)
        first_recipe.must_be_kind_of Recipe
        first_recipe.name.must_equal recipe.name
      end
    end

    it "raises StandardError for a bad recipe id" do
      VCR.use_cassette('recipes') do
        proc { EdamamWrapper.get_recipe(0000) }.must_raise
      end
    end


  end
end
