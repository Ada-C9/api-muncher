require 'test_helper'

describe EdemamApiWrapper do
  describe 'search_recipes' do
    it 'gives a list of recipes' do
      query = "pepper"
      VCR.use_cassette('recipes') do
        recipes = EdemamApiWrapper.search_recipes(query)

        recipes.each do |recipe|
          recipe.must_be_kind_of Recipe
        end
      end
    end

    it 'returns an error if no recipes exsist for that search' do
      query = " "

      VCR.use_cassette('recipes') do
        recipes = EdemamApiWrapper.search_recipes(query)

        recipes.each do |recipe|
          recipe.wont_be_instance_of Recipe
        end
      end
    end
  end

  describe 'show_recipe' do
    it ' can show an exsisting recipe' do
      uri = "http://www.edamam.com/ontologies/edamam.owl#recipe_e9d318b6c547e3e2adb395133c1e21cf"

      VCR.use_cassette('recipes') do
        recipe = EdemamApiWrapper.show_recipe(uri)

        recipe.must_be_kind_of Recipe
      end
    end

    # FIXME: Currently this test is not working, need further help to understand why
    it 'raises an error for a recipe that DNE' do
      uri = "http://www.edamam.com/ontologies/edamam.owl#recipe_e9d318b6c547e3e2adb395133c1e21cf"

      VCR.use_cassette('recipes') do
        recipe = EdemamApiWrapper.show_recipe(uri)

        recipe.wont_be_kind_of Recipe
      end
    end
  end
end
