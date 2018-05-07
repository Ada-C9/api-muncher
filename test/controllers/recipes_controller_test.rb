require "test_helper"

describe RecipesController do
	it "can get the index path" do
		get root_path

		must_respond_with :ok
	end

	it "can get a valid URI" do
		VCR.use_cassette("recipes") do
			get show_path,
			params: {
				uri: "http://www.edamam.com/ontologies/edamam.owl#recipe_fc9af2625e9e376eae885aca1d0396e4"
			}
			must_respond_with :ok
		end
	end

	it "redirects with invalid URI" do
		VCR.use_cassette("recipes") do
			get show_path,
			params: {
				uri: "http://www.gohuskies.com"
			}
			must_redirect_to root_path
		end
	end

	# it "can send a message" do
	#   post chat_create_path("PLACEHOLDER")
	#
	#   must_redirect_to root_path
	# end
end
