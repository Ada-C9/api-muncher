require 'test_helper'

describe EdamamApiWrapper do
  describe 'search_results' do
    it 'provides a collection of recipes for a query' do
      VCR.use_cassette('recipes') do
        recipes = EdamamApiWrapper.search_results("chicken")

        recipes.must_be_kind_of Array
        recipes.each do |recipe|
          recipe.must_be_kind_of Recipe
        end
      end
    end

    it 'raises an error if no query is provided' do
      VCR.use_cassette('recipes') do
        proc { recipes = EdamamApiWrapper.search_results() }.must_raise
      end
    end

    it 'raises an error for invalid query' do
      VCR.use_cassette('recipes') do
        proc { recipes = EdamamApiWrapper.search_results('12345') }.must_raise
        proc { recipes = EdamamApiWrapper.search_results('qwerty') }.must_raise
      end
    end
  end

  describe 'recipe_details' do
    it 'provides a single recipe' do
      VCR.use_cassette('recipe') do
        recipe = EdamamApiWrapper.recipe_details('7bf4a371c6884d809682a72808da7dc2')

        recipe.must_be_kind_of Recipe
      end
    end

    it 'raises an error if no recipe id is provided' do
      VCR.use_cassette('recipe') do
        proc { recipe = EdamamApiWrapper.recipe_details() }.must_raise
      end
    end

    it 'raises an error for invalid recipe id' do
      VCR.use_cassette('recipe') do
        proc { recipe = EdamamApiWrapper.recipe_details('12345') }.must_raise
        proc { recipe = EdamamApiWrapper.recipe_details('qwerty') }.must_raise
      end
    end
  end
end
