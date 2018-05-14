require 'test_helper'

describe EdamamApiWrapper do
  describe 'list_recipes' do
    it 'returns a list of valid hits from search parameter with no starting_index' do
      VCR.use_cassette("recipes") do
        key_words = "lemon chicken"
        recipes = EdamamApiWrapper.list_recipes(key_words)

        recipes.must_be_kind_of Hash
        recipes[:recipe_list].each do |recipe|
          recipe.must_be_instance_of Recipe
        end
      end
    end

    it 'returns a empty array if keywords result in no hits' do
      VCR.use_cassette("recipes") do
        key_words = "sdkjfksd jflksdjf ksdjf"
        recipes = EdamamApiWrapper.list_recipes(key_words)

        recipes.must_be_kind_of Hash
        recipes[:recipe_list].must_be_empty
      end
    end

    it 'returns a list of valid hits from search parameter with a starting_index' do
      VCR.use_cassette("recipes") do
        key_words = "lemon chicken"
        recipes = EdamamApiWrapper.list_recipes(key_words, 50)

        recipes.must_be_kind_of Hash
        recipes[:recipe_list].each do |recipe|
          recipe.must_be_instance_of Recipe
        end
      end
    end

    it 'returns a list of valid hits from search parameter with a last index if starting_index is greater than 99' do
      VCR.use_cassette("recipes") do
        key_words = "lemon chicken"
        recipes = EdamamApiWrapper.list_recipes(key_words, 100)

        recipes.must_be_kind_of Hash
        recipes[:recipe_list].each do |recipe|
          recipe.must_be_instance_of Recipe
        end
      end
    end

    it 'returns an empty array from search parameter with a last index greater than available hits' do
      VCR.use_cassette("recipes") do
        key_words = "flea"
        recipes = EdamamApiWrapper.list_recipes(key_words, 100)

        recipes.must_be_kind_of Hash
        recipes[:recipe_list].must_be_empty
      end
    end

    it 'returns an empty array / results from search parameter that are not a string' do
      VCR.use_cassette("recipes") do
        key_words = 123456
        recipes = EdamamApiWrapper.list_recipes(key_words, 100)

        recipes.must_be_kind_of Hash
        recipes[:recipe_list].must_be_empty
      end
    end

    it 'returns an empty array from search parameter that are nil' do
      VCR.use_cassette("recipes") do
        key_words = nil
        recipes = EdamamApiWrapper.list_recipes(key_words, 100)

        recipes.must_be_kind_of Hash
        recipes[:recipe_list].must_be_empty
      end
    end
  end

  describe 'return_recipe' do
    it 'returns an instance of one recipe' do
      VCR.use_cassette("recipe") do
        recipe = EdamamApiWrapper.return_recipe("8cb51d70083e7f9d44cc1d9f2bebc738")

        recipe.must_be_instance_of Recipe
      end
    end

    it 'returns nil if given an empty string' do
      VCR.use_cassette("recipe") do
        recipe = EdamamApiWrapper.return_recipe("")

        recipe.must_be_nil
      end
    end

    it 'returns nil if given nil' do
      VCR.use_cassette("recipe") do
        recipe = EdamamApiWrapper.return_recipe(nil)

        recipe.must_be_nil
      end
    end

    it 'returns nil if for invalid uri id' do
      VCR.use_cassette("recipe") do
        recipe = EdamamApiWrapper.return_recipe("123abc")

        recipe.must_be_nil
      end
    end

    it 'returns nil for non-string uri id input' do
      VCR.use_cassette("recipe") do
        recipe = EdamamApiWrapper.return_recipe(123456)

        recipe.must_be_nil
      end
    end
  end
end
