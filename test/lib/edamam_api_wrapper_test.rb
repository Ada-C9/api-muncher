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

	# it "must work when provided too many from" do
	# 	search_term = "ferret"
	# 	VCR.use_cassette("recipes") do
	# 		results = EdamamApiWrapper.search_recipes(search_term, 1000)
	#
	# 		results.must_be_kind_of Hash
	# 		results[:max_pages].must_equal 1
	# 		results[:recipes].must_be_kind_of Array
	# 		results[:recipes].size.must_equal 1
	# 		results[:recipes].all? { |recipe| recipe.class == Recipe }.must_equal true
	# 	end
	# end

end
