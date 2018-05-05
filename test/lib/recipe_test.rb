require 'test_helper'

describe Recipe do
  describe 'initialize' do
    it 'can be created with a label and a hash for options' do
      label = 'recipe name'
      options = {}

      recipe = Recipe.new(label, options)

      recipe.label.must_equal label
      recipe.options.must_be {}
    end

    it 'cannot be created without a label and an empty hash of options' do
      skip
    end
  end

  describe 'format_api' do
    before  do
      skip
    end

    it 'pulls the relevant information into a new instance of Recipe' do
      skip
    end

    it 'raises an exception without critical data' do
      skip
    end
  end
end
