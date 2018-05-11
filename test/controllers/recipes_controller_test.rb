require "test_helper"

describe RecipesController do
	describe "root" do
		it "can get the search path" do
			get root_path

			must_respond_with :success
		end
	end

	describe "show" do
		it "can get a valid URI" do
			VCR.use_cassette("recipes") do
				get show_path,
				params: {
					uri: "http://www.edamam.com/ontologies/edamam.owl#recipe_fc9af2625e9e376eae885aca1d0396e4"
				}
				flash[:alert].must_be_nil
				must_respond_with :success
			end
		end

		it "redirects with invalid URI" do
			VCR.use_cassette("recipes") do
				get show_path,
				params: { uri: "http://www.gohuskies.com" }
				flash[:alert].must_equal "Recipe does not exist"
				must_redirect_to root_path
			end
		end
	end

	describe "results" do
		it "can results for a valid search with no from" do
			VCR.use_cassette("recipes") do
				get results_path,
				params: { query_text: "chicken" }

				must_respond_with :success
			end
		end

		it "can results for a valid search with from" do
			VCR.use_cassette("recipes") do
				get results_path,
				params: { from: "2", query_text: "chicken" }
				must_respond_with :success
			end
		end

		it "can results for a valid search with no from" do
			VCR.use_cassette("recipes") do
				get results_path,
				params: { query_text: "chicken" }

				must_respond_with :success
			end
		end

		it "redirects with invalid search" do
			VCR.use_cassette("recipes") do
				get results_path,
				params: { }
				flash[:alert].must_equal "Something done broke!"
				must_redirect_to root_path
			end
		end
	end

end
