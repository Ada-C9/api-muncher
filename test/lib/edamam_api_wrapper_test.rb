require 'test_helper'

describe EdamamApiWrapper do

  describe 'list_recipes' do
    it "returns list of 10 recipes if given valid arguments and plenty of recipes exist on Edamam" do
      VCR.use_cassette("recipes") do
        recipe_list = EdamamApiWrapper.list_recipes("tofu", 3)

        recipe_list.count.must_equal 10
        recipe_list.each do |recipe|
          recipe.must_be_instance_of Recipe
        end
      end
    end

    it "returns empty array if given right valid arguments but no recipes exists on Edamam" do
      VCR.use_cassette("recipes") do
        recipe_list = EdamamApiWrapper.list_recipes("aaabbbcccdddeeefffggg", 1)

        recipe_list.count.must_equal 0
      end
    end

    it "raises ArgumentError if given wrong number of arguments" do
      VCR.use_cassette("recipes") do
        proc { recipe_list = EdamamApiWrapper.list_recipes
        }.must_raise ArgumentError
      end

      VCR.use_cassette("recipes") do
        proc { recipe_list = EdamamApiWrapper.list_recipes("term")
        }.must_raise ArgumentError
      end
    end
  end

  describe 'find_recipe' do
    it "returns correct recipe if given valid recipe id" do
      VCR.use_cassette("recipes") do
        recipe = EdamamApiWrapper.list_recipes("tofu", 3).first
        recipe_id = recipe.id

        recipe_found = EdamamApiWrapper.find_recipe(recipe_id)

        recipe_found.id.must_equal recipe.id
        recipe_found.title.must_equal recipe.title
        recipe_found.image.must_equal recipe.image
        recipe_found.source.must_equal recipe.source
        recipe_found.url.must_equal recipe.url
        recipe_found.ingredients.must_equal recipe.ingredients
        recipe_found.diet_labels.must_equal recipe.diet_labels
      end
    end

    it "returns return nil if given invalid recipe id" do
      VCR.use_cassette("recipes") do
        recipe_found = EdamamApiWrapper.find_recipe(1)

        recipe_found.must_be_nil
      end
    end

    it "raises ArgumentError if given wrong number of arguments" do
      VCR.use_cassette("recipes") do
        proc {
          EdamamApiWrapper.find_recipe
        }.must_raise ArgumentError
      end
    end
  end
end
