require 'test_helper'

describe MuncherApiWrapper do
  describe 'get_recipes' do
    it 'must return a colleciton of recipes' do
      VCR.use_cassette('recipes') do
        recipes = MuncherApiWrapper.get_recipes('chicken', '1')

        recipes.each do |recipe|
          recipe.must_be_instance_of Recipe
        end
      end
    end
  end # get_recipes

  describe 'get_one_recipe' do
    let (:recipe_uri) {'http://www.edamam.com/ontologies/edamam.owl#recipe_7bf4a371c6884d809682a72808da7dc2'}

    it 'must return a single recipe if the uri is found on edamam' do
      VCR.use_cassette('recipes') do
        recipe = MuncherApiWrapper.get_one_recipe(recipe_uri)

        recipe.must_be_instance_of Recipe
        recipe.name.must_equal 'Teriyaki Chicken'
      end
    end

    it 'must raise an error if the recipe uri is not found on edamam' do
      VCR.use_cassette('recipes') do
        a_fake_uri = 'this_is_not_a_uri'
        proc { MuncherApiWrapper.get_one_recipe(a_fake_uri) }.must_raise StandardError
      end
    end

    it 'must raise an error if the recipe_uri is nil or empty' do
      VCR.use_cassette('recipes') do
        proc { MuncherApiWrapper.get_one_recipe(nil) }.must_raise ArgumentError

        proc { MuncherApiWrapper.get_one_recipe('') }.must_raise ArgumentError
      end
    end
  end # get one recipe
end # Muncher Api Wrapper
