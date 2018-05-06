require "test_helper"

describe EdamamApiWrapper do

  describe 'list_recipes' do

    it 'gives a list of recipes for an appropriate search' do
      VCR.use_cassette('recipes') do
        recipes = EdamamApiWrapper.list_recipes('ceviche')

        recipes.each do |recipe|
          recipe.must_be_kind_of Recipe
        end
      end
    end # it do

    it 'returns an empty array for a blank search' do
      VCR.use_cassette('recipes') do
        recipes = EdamamApiWrapper.list_recipes('')

        recipes.must_be_kind_of Array
        recipes.must_be :empty?
      end
    end # it do

    it 'returns an empty array for a bad search' do
      VCR.use_cassette('recipes') do
        recipes = EdamamApiWrapper.list_recipes('xxxxxxxxxxxxxxxxx')

        recipes.must_be_kind_of Array
        recipes.must_be :empty?
      end
    end # it do

  end # list_recipes

  describe 'show_recipe' do

    it 'returns a recipe that exists' do
      VCR.use_cassette("recipe") do
        uri_id = "2b4b94d566015f1edaadcb4397ba0422"
        recipe = EdamamApiWrapper.show_recipe(uri_id)
        recipe.must_be_kind_of Recipe
        recipe.uri_id.must_equal uri_id
      end
    end # it do

    it 'raises an error for a recipe that DNE / bad recipe uri' do
      VCR.use_cassette("bad_recipe") do
        uri_id = ""
        result = proc { EdamamApiWrapper.show_recipe(uri_id) }
        result.must_raise
      end
    end

  end # show_recipe

end # EdamamApiWrapper
