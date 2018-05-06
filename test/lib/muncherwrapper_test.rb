require 'test_helper'

describe MuncherWrapper do

  describe "self.get_recipes(search_phrase)" do

    it "can get list of search results" do
      VCR.use_cassette("muncher") do
        recipes = MuncherWrapper.get_recipes("ube")
        recipes.must_be_instance_of Array
      end
    end

    it "will return an empty array with a bad search" do
      VCR.use_cassette("muncher") do
        recipes = MuncherWrapper.get_recipes("")
        recipes.must_equal []
      end
    end
  end

  describe "self.show_recipe(uri)" do

    it "will show one recipe" do


      VCR.use_cassette("show_recipe") do

        recipe = MuncherWrapper.get_recipes("ube").first
        recipe_id = recipe.id

        result = MuncherWrapper.show_recipe(recipe_id)

        result.id.must_equal recipe_id
        result.label.must_equal recipe.label
      end

    end

    it "will return nil if uri is blank or response does not exist" do

      VCR.use_cassette("show_recipe") do
        skip
        result = MuncherWrapper.show_recipe("fakeuri")
        result.must_be_nil
      end
    end

    it "raises ArgumentError if given wrong number of arguments" do
      VCR.use_cassette("muncher") do
        proc {
          MuncherWrapper.show_recipe
        }.must_raise ArgumentError
      end
    end

  end


end
