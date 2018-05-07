require 'test_helper'


describe RecipeApiWrapper do

  describe "list_recipes" do
    it "gives a list of recipes when given a valid argument" do
      VCR.use_cassette("recipes") do
        recipe_list = RecipeApiWrapper.list_recipes("chicken")

        recipe_list.each do |recipe|
          recipe.must_be_kind_of Recipe
        end
      end
    end

    it "returns empty array if no recipes exists on Edamam" do
      VCR.use_cassette("recipes") do
        recipe_list = RecipeApiWrapper.list_recipes("yummmmmmmyyyyyyyy")

        recipe_list.count.must_equal 0
      end
    end
  end

  describe "show_recipe" do
    it "can find an individual recipe from the uri" do
      VCR.use_cassette("recipes") do
        recipe = RecipeApiWrapper.list_recipes("chicken").first

        recipe_id = recipe.uri.split("_")[1]

        RecipeApiWrapper.show_recipe(recipe_id)
      end
    end

    it "raise an error when you try to find a recipe DNE" do
      VCR.use_cassette("recipes") do
        uri = "7bf4a371c6884d809682a72808da7dc87029134hhlkjh34"
        proc {
          RecipeApiWrapper.show_recipe(uri)
        }.must_raise RecipeApiWrapper::RecipeError
      end
    end
  end
end
