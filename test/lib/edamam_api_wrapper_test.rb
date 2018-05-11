require 'test_helper'

describe EdamamApiWrapper do

	it "Can get results back" do
		search_term = "chicken"
		VCR.use_cassette("recipes") do
			results = EdamamApiWrapper.search_recipes(search_term, 0)

			results.must_be_kind_of Hash
			results[:max_pages].must_equal 5
			results[:recipes].must_be_kind_of Array
			results[:recipes].size.must_equal 10
			results[:recipes].all? { |recipe| recipe.class == Recipe }.must_equal true
		end
	end

	it "raises an error for invalid information" do
		proc { VCR.use_cassette("recipes") do
			EdamamApiWrapper.search_recipes("potato", "foo")
		end }.must_raise ArgumentError

		proc { VCR.use_cassette("recipes") do
			EdamamApiWrapper.search_recipes("potato", nil)
		end }.must_raise ArgumentError

		proc { VCR.use_cassette("recipes") do
			EdamamApiWrapper.search_recipes(nil, 0)
		end }.must_raise ArgumentError

		proc { VCR.use_cassette("recipes") do
			EdamamApiWrapper.search_recipes("potato", -1)
		end }.must_raise ArgumentError

	end

	it "doesn't break if it can't find anything" do
		VCR.use_cassette("recipes") do
			results = EdamamApiWrapper.search_recipes("", 0)
			results.must_be_kind_of Hash
			results[:max_pages].must_equal 0
			results[:recipes].must_be_kind_of Array
			results[:recipes].size.must_equal 0 # does not make Recipe objects
		end

		# Assumes that there are no recipes named 'foobarbazzzzzzzzzzz'
		VCR.use_cassette("recipes") do
			results = EdamamApiWrapper.search_recipes("foobarbazzzzzzzzzzz", 0)
			results.must_be_kind_of Hash
			results[:max_pages].must_equal 0
			results[:recipes].must_be_kind_of Array
			results[:recipes].size.must_equal 0 # does not make Recipe objects
		end
	end

	it "gets different results back" do
		search_term = "chicken"
		VCR.use_cassette("recipes") do
			results_0 = EdamamApiWrapper.search_recipes(search_term, 0)
			results_1 = EdamamApiWrapper.search_recipes(search_term, 1)

			(results_0 == results_1).must_equal false
		end
	end

	it "must not break but give no results when from is too large" do
		search_term = "ferret" # only one result, according to Postman
		from = 1000
		VCR.use_cassette("recipes") do
			results = EdamamApiWrapper.search_recipes(search_term, from)

			results.must_be_kind_of Hash
			results[:max_pages].must_equal 1
			results[:recipes].must_be_kind_of Array
			results[:recipes].size.must_equal 0
		end
	end

	it "Can get a result using uri" do
		test_uri = "http://www.edamam.com/ontologies/edamam.owl#recipe_46f0285ac49d2b918bc7171142de042b"
		VCR.use_cassette("recipes") do
			result = EdamamApiWrapper.get_recipe(test_uri)

			result.must_be_kind_of Recipe
			result.name.must_equal "Fish Curry"
			result.uri.must_equal test_uri
		end
	end

	it "raises an error for invalid information" do
		proc { VCR.use_cassette("recipes") do
			EdamamApiWrapper.get_recipe("foo")
		end }.must_raise JSON::ParserError

		proc { VCR.use_cassette("recipes") do
			EdamamApiWrapper.get_recipe(nil)
		end }.must_raise ArgumentError

		proc { VCR.use_cassette("recipes") do
			EdamamApiWrapper.get_recipe(42)
		end }.must_raise ArgumentError
	end

	it "doesn't break if it can't find anything" do
		VCR.use_cassette("recipes") do
			result = EdamamApiWrapper.get_recipe("http://google.com")
			result.must_be_nil
		end
	end

end
