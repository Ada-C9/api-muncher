require 'test_helper'

describe EdamamApiWrapper do

 it "Can get results back" do
	 search_term = "chicken"
	 VCR.use_cassette("recipes") do
		 results = EdamamApiWrapper.search_recipes(search_term, 0)

		 results.must_be_kind_of Hash
		 results[:max_pages].must_be_kind_of Integer
		 results[:recipes].must_be_kind_of Array
		 results[:recipes].size.must_equal 10
		 results[:recipes].all? { |recipe| recipe.class == Recipe }.must_equal true
	 end
 end

 it "raises an error for invalid information" do
	 search_term = "potato"

	proc { VCR.use_cassette("recipes") do
		 EdamamApiWrapper.search_recipes(search_term, "foo")
	 end }.must_raise ArgumentError
 end

end
