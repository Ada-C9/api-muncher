require 'test_helper'

describe EdamamApiWrapper do
  describe 'list_recipes' do
    it 'returns a list of valid hits from search parameter' do
      VCR.use_cassette("recipes") do
        key_words = "lemon chicken"
        recipes = EdamamApiWrapper.list_recipes(key_words)

        recipes.must_be_kind_of Array
        recipes.each do |recipe|
          recipe.must_be_instance_of Recipe
        end
      end
    end

    it 'returns a empty array if keywords result in no hits' do
      VCR.use_cassette("recipes") do
        key_words = "sdkjfksd jflksdjf ksdjf"
        recipes = EdamamApiWrapper.list_recipes(key_words)

        recipes.must_be_kind_of Array
        recipes.must_be_empty
      end
    end

  end

end
