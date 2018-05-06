require 'test_helper'

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

    it 'raises error when you send a nonexistant id' do
      VCR.use_cassette('chicken') do
        recipe_list = MuncherApiWrapper.list_recipes("chicken")
        id = recipe_list.first[:id] + "abc"

        proc {
          MuncherApiWrapper.show_recipe(id)
        }.must_raise StandardError
      end
    end

    it 'raises error when you send a blank id' do
      VCR.use_cassette('chicken') do
        recipe_list = MuncherApiWrapper.list_recipes("chicken")
        id = " "

        proc {
          MuncherApiWrapper.show_recipe(id)
        }.must_raise StandardError
      end
    end
  end

end
