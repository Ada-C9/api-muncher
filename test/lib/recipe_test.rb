require 'test_helper'

describe 'Recipe' do
  describe 'initialize' do
    it 'can be created with name and id' do
      data = {
        id: 12345,
        name: 'test recipe'
      }

      recipe = Recipe.new(data)

      recipe.name.must_equal data[:name]
      recipe.id.must_equal data[:id]
    end

    it 'cannot be created without a name or id' do
      proc { Recipe.new({}) }.must_raise ArgumentError
      proc { Recipe.new({ name: 'test recipe' }) }.must_raise ArgumentError
      proc { Recipe.new({ id: 12345 }) }.must_raise ArgumentError
    end
  end

  describe 'from_query_api' do
    before do
      @recipe_data = {
        "recipe" => {
            "uri" => "http://www.edamam.com/ontologies/edamam.owl#recipe_7bf4a371c6884d809682a72808da7dc2",
            "label" => "Teriyaki Chicken"
        }
      }
    end

    it 'pulls the relevant information into an instance of Recipe' do
      recipe = Recipe.from_query_api(@recipe_data)
      recipe.must_be_kind_of Recipe
      recipe.id.must_equal "7bf4a371c6884d809682a72808da7dc2"
      recipe.name.must_equal "Teriyaki Chicken"
    end

    it 'raises an exception without an id' do
        @recipe_data["recipe"]["uri"] = nil
        proc { Recipe.from_query_api(@recipe_data) }.must_raise StandardError
    end

    it 'raises an exception without a name' do
        @recipe_data["recipe"]["label"] = nil
        proc { Recipe.from_query_api(@recipe_data) }.must_raise StandardError
    end
  end

  describe 'from_recipe_api' do
    before do
      @recipe_data = [
        {
          "uri" => "http://www.edamam.com/ontologies/edamam.owl#recipe_7bf4a371c6884d809682a72808da7dc2",
          "label" => "Teriyaki Chicken"
        }
      ]
    end

    it 'pulls the relevant information into an instance of Recipe' do
      recipe = Recipe.from_recipe_api(@recipe_data)
      recipe.must_be_kind_of Recipe
      recipe.id.must_equal "7bf4a371c6884d809682a72808da7dc2"
      recipe.name.must_equal "Teriyaki Chicken"
    end

    it 'raises an exception without an id' do
        @recipe_data[0]["uri"] = nil
        proc { Recipe.from_recipe_api(@recipe_data) }.must_raise StandardError
    end

    it 'raises an exception without a name' do
        @recipe_data[0]["label"] = nil
        proc { Recipe.from_recipe_api(@recipe_data) }.must_raise StandardError
    end
  end
end
