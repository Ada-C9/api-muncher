require "test_helper"

describe "EdamamApiWrapper" do
  describe "recipe_list" do

    it "gives a list of recipes" do
      VCR.use_cassette("recipes") do
        recipes = EdamamApiWrapper.recipe_list

        recipe.each do |recipe|
          recipe.must_be_kind_of Recipe

          # remember to gem "dotenv-rails" move it in the gem file to the development and test , not just developmet because it is going to fail.
        end
      end
    end

  end

  describe "one_recipe" do

    it "gives a recipe" do
      VCR.use_cassette("recipe") do
        recipe = EdamamApiWrapper.recipe_list


        recipe.must_be_kind_of Recipe

        # remember to gem "dotenv-rails" move it in the gem file to the development and test , not just developmet because it is going to fail.
      end
    end
  end

end
