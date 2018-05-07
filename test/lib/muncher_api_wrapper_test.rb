require 'test_helper'
require 'httparty'

describe MuncherApiWrapper do
  describe 'list_recipes(terms)' do
    it 'gives a list of recipes with real word, no spaces' do
      VCR.use_cassette('chicken') do
        recipe_list = MuncherApiWrapper.list_recipes("chicken")

        recipe_list.must_be_kind_of Array

        recipe_list.empty?.must_equal false
        recipe_list.each do |recipe_info|
          recipe_info.nil?.must_equal false
          recipe_info[:label].nil?.must_equal false
          recipe_info[:id].nil?.must_equal false
          recipe_info[:image].nil?.must_equal false
        end
      end
    end

    it 'gives a list of recipes with real word, spaces' do
      VCR.use_cassette('chicken teriyaki') do
        recipe_list = MuncherApiWrapper.list_recipes("chicken teriyaki")

        recipe_list.must_be_kind_of Array

        recipe_list.empty?.must_equal false
        recipe_list.each do |recipe_info|
          recipe_info.nil?.must_equal false
          recipe_info[:label].nil?.must_equal false
          recipe_info[:id].nil?.must_equal false
          recipe_info[:image].nil?.must_equal false
        end
      end
    end

    it 'gives a empty list of recipes with fake word' do
      VCR.use_cassette('fake abc') do
        recipe_list = MuncherApiWrapper.list_recipes("fake abc")

        recipe_list.must_be_kind_of Array
        recipe_list.empty?.must_equal true
      end
    end

    it 'gives a empty list of recipes with space' do
      VCR.use_cassette('space') do
        recipe_list = MuncherApiWrapper.list_recipes(" ")

        recipe_list.must_be_kind_of Array
        recipe_list.empty?.must_equal true
      end
    end
  end

  describe 'show_recipe(id)' do
    it 'shows a real recipe' do
      VCR.use_cassette('chicken') do
        recipe_list = MuncherApiWrapper.list_recipes("chicken")
        id = recipe_list.first[:id]

        recipe = MuncherApiWrapper.show_recipe(id)
        recipe.must_be_kind_of Recipe
        recipe.label.must_equal recipe_list.first[:label]
      end
    end

    it 'returns nil when you send an invalid id' do
      VCR.use_cassette('chicken') do
        recipe_list = MuncherApiWrapper.list_recipes("chicken")
        id = recipe_list.first[:id] + "abc"

        recipe = MuncherApiWrapper.show_recipe(id)
        recipe.must_equal nil
      end
    end

    it 'returns nil when you send a blank id' do
      VCR.use_cassette('chicken') do

        id = " "

        recipe = MuncherApiWrapper.show_recipe(id)
        recipe.must_equal nil
      end
    end
  end

  describe '.get_ingredients' do
    it 'gets the ingredients appropriately' do
      VCR.use_cassette('chicken') do
        url = "https://api.edamam.com/search?r=http://www.edamam.com/ontologies/edamam.owl#recipe_888e9fc4a808e9e4ccdb2ac24a6a2f46&app_id=#{ENV["APP_ID"]}&app_key=#{ENV["APP_KEY"]}"

        escaped = URI.escape(url)
        response = HTTParty.get(escaped)

        recipe = MuncherApiWrapper.show_recipe("888e9fc4a808e9e4ccdb2ac24a6a2f46")

        MuncherApiWrapper.get_ingredients(response[0]).must_equal recipe.ingredients
      end
    end
  end

  describe '.get_nutrition_info' do
    it 'gets the nutrition info appropriately' do
      VCR.use_cassette('chicken') do
        url = "https://api.edamam.com/search?r=http://www.edamam.com/ontologies/edamam.owl#recipe_888e9fc4a808e9e4ccdb2ac24a6a2f46&app_id=#{ENV["APP_ID"]}&app_key=#{ENV["APP_KEY"]}"

        escaped = URI.escape(url)
        response = HTTParty.get(escaped)

        recipe = MuncherApiWrapper.show_recipe("888e9fc4a808e9e4ccdb2ac24a6a2f46")

        MuncherApiWrapper.get_nutrition_info(response[0]).must_equal recipe.nutrition_info
      end
    end
  end

end
