require 'test_helper'


describe RecipeApiWrapper do

  describe "list_recipes" do
    it "gives a list of recipes when given a valid argument" do
      VCR.use_cassette("recipes") do
        recipe_list = RecipeApiWrapper.list_recipes("chicken")

        recipe_list.each do |recipe|
          recipe.must_be_kind_of Recipe
        end
      end
    end

    it "returns empty array if no recipes exists on Edamam" do
      VCR.use_cassette("recipes") do
        recipe_list = RecipeApiWrapper.list_recipes("yummmmmmmyyyyyyyy")

        recipe_list.count.must_equal 0
      end
    end

    it "raises an error when no argument is given" do
      VCR.use_cassette("recipes") do
        recipe_list = RecipeApiWrapper.list_recipes("")

        proc { recipe_list }.must_raise ArgumentError
      end

    end
  end

end
