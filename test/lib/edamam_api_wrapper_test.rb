require 'test_helper'

describe EdamamApiWrapper do
  before do
    @search_term = "egg"
    @bogus_search_term = "hfkhf"
  end

  describe 'list_of_recipes' do
    it 'gives a list of recipes' do

      VCR.use_cassette('recipes') do
        recipes = EdamamApiWrapper.list_of_recipes(@search_term)

        recipes.each do |recipe|
          recipe.must_be_kind_of Recipe
        end

      end
    end #it gives a list of recipes

    it 'returns an empty array for a bogus search term so the recipe DNE in Edamam' do
      VCR.use_cassette('recipes') do
        recipes = EdamamApiWrapper.list_of_recipes(@bogus_search_term)

        recipes.each do |recipe|
          recipe.must_be_kind_of Recipe
        end

      end
    end

    it "Will return an empty array for invalid app_id and app_key" do
      VCR.use_cassette("recipes") do
        recipes = EdamamApiWrapper.list_of_recipes(@search_term, "wrong_app_id", "wrong_app_key")
        recipes.must_be_instance_of Array
        recipes.must_equal []
      end
    end


  end # describe list_of_recipes

  describe 'show recipe' do
    it 'returns a valid recipe with a valid recipe uri' do
      VCR.use_cassette("recipes") do
        uri = "edb6a25bfb2aa0613ccb2c2f545b30a5"
        recipe = EdamamApiWrapper.show_recipe(uri)
      end

    end

    it 'returns an error if bogus arguments' do
      VCR.use_cassette("recipes") do
        proc {
          EdamamApiWrapper.show_recipe
        }.must_raise ArgumentError
      end
    end

    it 'returns nil with a bogus recipe uri' do
      VCR.use_cassette("recipes") do
        recipe_found = EdamamApiWrapper.show_recipe("99999999999999999999999999999")

        recipe_found.must_be_nil
      end
    end
  end # describe show recipes

end # class EdamamApiWrapper
