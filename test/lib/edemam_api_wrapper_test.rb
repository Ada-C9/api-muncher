require 'test_helper'

describe EdemamApiWrapper do
  describe 'search_recipes' do
    it 'gives a list of recipes' do
      query = "pepper"
      VCR.use_cassette('recipes') do
        recipes = EdemamApiWrapper.search_recipes(query)

        get recipes_path, params: {query: "pepper"}
        must_respond_with :success

        recipes.each do |recipe|
          recipe.must_be_kind_of Recipe
        end
      end
    end

    it 'returns an error if no recipes exsist for that search' do
      VCR.use_cassette('recipes') do

      get recipes_path, params: {query: ""}
      must_respond_with :success
      flash[:status].must_respond_with :failure
      end
    end
  end

  describe 'show_recipe' do
    it ' can show an exsisting recipe' do
      uri = "http://www.edamam.com/ontologies/edamam.owl#recipe_e9d318b6c547e3e2adb395133c1e21cf"

      VCR.use_cassette('recipes') do
        recipes =  EdemamApiWrapper.search_recipes("pepper")
        recipe = recipes.first

        get recipe_path(recipe.id)
        must_respond_with :success
      end
    end

    # FIXME: Currently this test is not working, need further help to understand why
    it 'fails for a recipe that DNE' do
      uri = "http://www.edamam.com/ontologies/edamam.owl#recipe_e9d318b6c547e3e2adb395133c1e21cf"

      VCR.use_cassette('recipes') do

        get recipe_path("0000")
        flash[:status].must_respond_with :failure
      end
    end
  end
end
