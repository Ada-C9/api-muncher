require "test_helper"

describe "RecipesController" do
  describe "root" do
    it "shows the root page" do
      get root_path
      must_respond_with :success
    end
  end

  describe "index" do
    it "returns a list of search recipes results" do
      query = "rabbit"
      VCR.use_cassette("recipes") do
        RecipeSearchWrapper.search_recipes(query)

        get query_recipe_path(query: query)
        must_respond_with :success
      end
    end

    it "doesn't return results for a nonsense search term" do
      query = "zzzzzzadsfasdfasdfasdf"
      VCR.use_cassette("recipes") do
        RecipeSearchWrapper.search_recipes(query)

        get query_recipe_path(query: query)
        must_redirect_to root_path
      end
    end
  end

  describe "show" do
    it "displays the recipe page for the selected recipe" do
      VCR.use_cassette("show") do
        uri = "http://www.edamam.com/ontologies/edamam.owl#recipe_b79327d05b8e5b838ad6cfd9576b30b6"
        label = "Chicken Vesuvio"

        recipe = RecipeSearchWrapper.find_recipe(uri)
        recipe.must_be_kind_of Recipe
        get recipe_path(uri: uri, label: label)
        must_respond_with :success
      end
    end

    it "results in not_found if the recipe uri does not exist" do
      # VCR.use_cassette("show") do
      #   uri = "..."
      #   label = "thisisfake"
      #
      #   proc {recipe = RecipeSearchWrapper.find_recipe(uri)}.must raise
        # recipe.must_equal nil
        # get recipe_path(uri: uri, label: label)
        # must_respond_with :not_found
      # end

    end
  end


end
