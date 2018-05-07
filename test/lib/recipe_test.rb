require 'test_helper'

# FIXME: Currently broken, need to fix. Have Charles and I walk through why in tutoring
describe Recipe do
  describe 'initialize' do
    it 'can be created with a label and a hash for options' do
      label = 'recipe name'
      options = {}

      recipe = Recipe.new(label, options)

      recipe.label.must_equal label
      recipe.options.must_be_kind_of hash
    end

    it 'cannot be created without a label and an empty hash of options' do
      proc { Recipe.new() }.must_raise ArgumentError
      proc { Recipe.new('label') }.must_raise ArgumentError
      proc { Recipe.new(nil, options) }.must_raise ArgumentError
      proc { Recipe.new('', options) }.must_raise ArgumentError
    end
  end

  describe 'format_api' do
    before  do
      @fake_recipe = {
        label = 'some name',
        options = {
          uri = "a uri",
          image = "an image url",
          source = "got it",
          recipe__url = "wow lots of url",
          ingredients = "stuff to eat",
          calories = "123",
          healthLabels = "gluten"
        }
      }
    end

    it 'pulls the relevant information into a new instance of Recipe' do
      recipe = Recipe.format_api(@fake_recipe)

      recipe.must_be_kind_of Recipe
      recipe.label.must_equal @fake_recipe["label"]
      recipe.options.must_equal @fake_recipe["options"]
    end

    it 'raises an exception without critical data' do
      @fake_recipe["label"] = nil

      proc {
        Recipe.format_api(@fake_recipe)
      }.must_raise
    end
  end
end
