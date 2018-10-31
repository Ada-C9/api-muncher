require 'test_helper'
require 'pry'

describe EdamamApiWrapper do
  describe 'recipe_list' do
    it 'gives a list of recipes' do
      VCR.use_cassette("recipes") do
        recipe = EdamamApiWrapper.recipe_list("chicken")

        recipe.each do |item|
          item.must_be_kind_of Recipe
        end
      end
    end
    it 'raises an error when the query DNE' do
      VCR.use_cassette("recipes") do
        food_item = []
        proc { EdamamApiWrapper.recipe_list(food_item) }.must_raise
      end

    end
  end

  describe 'recipe_detail' do
    it 'show details on an individual recipe with an uri' do
      VCR.use_cassette("recipes") do
        response = EdamamApiWrapper.recipe_list("chicken")

        show_recipe = response.first.uri
        EdamamApiWrapper.recipe_detail(show_recipe)
        .must_be_kind_of Recipe
      end
    end
    it 'throws an error if the recipe uri is invalid' do
      VCR.use_cassette("recipes") do
        uri = nil
        proc {EdamamApiWrapper.recipe_detail(uri) }.must_raise
      end
    end
  end


end
