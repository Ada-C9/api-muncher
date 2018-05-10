require "test_helper"

describe "EdamamApiWrapper" do
  describe "recipe_list" do

    it "gives a list of recipes" do
      VCR.use_cassette("recipes") do
        recipes = EdamamApiWrapper.recipe_list("chicken")

        recipes.each do |recipe|
          recipe.must_be_kind_of Recipe

          # remember to gem "dotenv-rails" move it in the gem file to the development and test , not just developmet because it is going to fail.
        end
      end
    end

  end

  describe "one_recipe" do

    it "gives a recipe" do
      VCR.use_cassette("recipe") do

        uri = "59c70510ab18f27b3c374f5c4790c8b9"

        recipe = EdamamApiWrapper.one_recipe(uri)


        recipe.must_be_kind_of Recipe

        # remember to gem "dotenv-rails" move it in the gem file to the development and test , not just developmet because it is going to fail.
      end
    end
  end

end
