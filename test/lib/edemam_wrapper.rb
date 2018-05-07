require 'test_helper'

describe EdemamWrapper do

  describe 'search_recipes' do

    it "gives a list of recipes" do
      VCR.use_cassette("recipe") do
        recipes = EdemamWrapper.search_recipes("chicken")
        recipes.count.wont_be_nil
        recipes.each do |recipe|
          recipe.must_be_instance_of Recipe
        end
      end
    end

    it "returns an empty array if there are no recipes matching the serarch term" do
      VCR.use_cassette("recipe") do
        recipes = EdemamWrapper.search_recipes("")
        recipes.must_equal []
      end
    end

  end

  describe 'show_recipe' do

    it "shows the details for a single recipe" do
      VCR.use_cassette("recipes") do
        recipe = EdemamWrapper.show_recipe("7bf4a371c6884d809682a72808da7dc2")
        recipe.wont_be_nil
        recipe.name.must_equal 'Teriyaki Chicken'
      end
    end

    it "throws an error with a bogus id" do
      VCR.use_cassette("recipes") do
        proc { EdemamWrapper.show_recipe("").must_raise ArgumentError }
      end
    end

  end

end
