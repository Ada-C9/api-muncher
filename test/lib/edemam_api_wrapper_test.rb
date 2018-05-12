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
      query = 'wedasfgt'
      VCR.use_cassette('recipes') do
        recipes = EdemamApiWrapper.search_recipes(query)

        recipes.must_be_kind_of Array
        recipes.must_be :empty?
      end
    end
  end

  describe 'show recipe' do
    it 'can show a single recipe' do
      uri = "http://www.edamam.com/ontologies/edamam.owl#recipe_e9d318b6c547e3e2adb395133c1e21cf"

      VCR.use_cassette('recipes') do
        recipe = EdemamApiWrapper.show_recipe(uri)

        recipe.must_be_kind_of Recipe
        recipe.uri.must_equal uri
      end
    end

    it 'will raise an error if passed an empty URI' do
      uri = " "
      VCR.use_cassette('recipes') do
        proc {
          recipe = EdemamApiWrapper.show_recipe(uri)
        }.must_raise ArgumentError
      end
    end

    it 'will raise an error if passed a uri that is nil' do
      uri = nil
      VCR.use_cassette('recipes') do
        proc {
          recipe = EdemamApiWrapper.show_recipe(uri)
        }.must_raise ArgumentError
      end
    end

    it 'will raise an error if passed a bad uri' do

      uri = "http://www.edamam.com/ontologies/edamam.owl#recipe_e9d318b6c547e3e2adb395133c1e21cd"

      VCR.use_cassette('recipes') do
        recipe = EdemamApiWrapper.show_recipe(uri)

        recipe.must_be_nil
      end
    end
  end
end
