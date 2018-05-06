require "test_helper"

# Note You will also need to place the VCR.use_cassette block around your controller tests as well. Otherwise your controller tests, which use the API will fail.

describe "Recipes" do
	describe "list_recipes" do
		it "lists recipes based on search" do
			VCR.use_cassette("recipes") do
				recipes = RecipeApiWrapper.list_recipes("ice cream")

				recipes.each do |recipe|
					recipe.must_be_kind_of Recipe
				end
			end
		end
	end

	describe "get_details" do
		it "returns the details for a specific recipe" do
			VCR.use_cassette("recipes") do
						search = "ice cream"
						response = RecipeApiWrapper.get_details("115b7da63f48e228cfdbf88e0e0a338a")

						response.must_be_kind_of Recipe
			end
		end
	end
end
