require "test_helper"

describe RecipesController do
  # it "must be a real test" do
  #   flunk "Need real tests"
  # end

  describe 'index' do
    it "returns a list of search recipes results" do
      query = "chicken"
      VCR.use_cassette("recipes") do
        RecipeApiWrapper.list_recipes(query)
        get recipes_path(query: query)

        must_respond_with :success
      end
    end

    it "won't return anything for a search term with no results" do
      query = "hjn2w0qq"
      VCR.use_cassette("recipes") do
        RecipeApiWrapper.list_recipes(query)

        get recipes_path(query: query)
        must_redirect_to root_path
      end
    end
  end

  describe 'show' do

    it "displays the recipe page for the selected recipe" do
      VCR.use_cassette("recipe") do
        uri = "http://www.edamam.com/ontologies/edamam.owl#recipe_e427aa9f6e7a96ecadbf994d9f75fd14"
        label = "Chicken Florentine Pesto Pasta"

        recipe = RecipeApiWrapper.show_recipe(uri)
        recipe.must_be_kind_of Recipe
        get recipe_path(uri: uri, label: label)
        must_respond_with :success
      end
    end
  end
end
