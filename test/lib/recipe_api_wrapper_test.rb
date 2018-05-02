require "test_helper"

describe "Recipes" do
	describe "search" do
		it "takes in parameters and reroutes" do

		end
	end

	describe "list_recipes" do
		it "lists recipes based on search" do
			VCR.use_cassette("recipes") do
				recipes = RecipeApiWrapper.list_recipes

				recipes.each do |recipe|
					recipe.must_be_kind_of Recipe
				end
			end 
		end
	end
end
