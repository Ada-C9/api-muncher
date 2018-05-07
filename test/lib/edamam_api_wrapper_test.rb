require "test_helper"

describe EdamamApiWrapper do
  describe 'list_recipes' do
    it 'returns a collection of recipes' do
      VCR.use_cassette("recipes") do
        recipes = EdamamApiWrapper.list_recipes("cheese")

        recipes.each do |recipe|
          recipe.must_be_kind_of Recipe
        end
      end
    end
  end

  describe 'display_recipe' do
    it 'returns one recipe' do
      VCR.use_cassette("recipes") do
        recipe = EdamamApiWrapper.display_recipe("9b5945e03f05acbf9d69625138385408")

        recipe.must_be_kind_of Recipe
      end
    end
  end

end
