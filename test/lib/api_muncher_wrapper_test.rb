require 'test_helper'

describe ApiMuncherWrapper do

  describe "search_recipes" do

    it "lists a set of recipes if given correct arguments" do

      VCR.use_cassette("recipes") do

        recipes = ApiMuncherWrapper.search_recipes("pesto")
        recipes.count.must_equal 30
        recipes.must_be_instance_of Array
        recipes.each do |recipe|
          recipe.must_be_instance_of Recipe
        end
      end
    end

    it "will return an empty array if recipe does not exist" do

      VCR.use_cassette("recipes") do
        recipes = ApiMuncherWrapper.search_recipes("abbbcd1234567")
        recipes.count.must_equal 0
      end
    end

  end

  describe "find" do

    it "will find correct recipe if given valid arguments" do

        VCR.use_cassette("recipes") do
          recipe = ApiMuncherWrapper.search_recipes("pesto").first
          recipe.must_be_instance_of Recipe
          recipe_id = recipe.id
          recipe_found = ApiMuncherWrapper.find_recipe(recipe_id)
          recipe_found.id.must_equal recipe.id
          recipe_found.label.must_equal recipe.label

        end
    end

    it "will return nil if bogus arguments" do

        VCR.use_cassette("recipes") do

          recipe = ApiMuncherWrapper.find_recipe("blah")
          recipe.must_be_nil

        end

    end


  end


end
