require 'test_helper'


describe EdamamApiWrapper do

  describe "recipe_search_result(query)" do

    it "gets a list of 100 valid search results for a query with a common ingredient" do

      query = "chicken"
      VCR.use_cassette("recipes") do
        response = EdamamApiWrapper.recipe_search_result(query)
        response.must_be_kind_of Array
        response.length.must_equal 100
        response.first.must_be_instance_of Recipe
        response.first.name.must_equal "Teriyaki Chicken"
      end

    end


    it "gets a list of less than 100 valid search results for a query with an uncommon but real ingredient" do

      query = "necco"

      VCR.use_cassette("recipes") do
        response = EdamamApiWrapper.recipe_search_result(query)
        response.must_be_kind_of Array
        response.length.must_be :>, 0
        response.length.must_be :<, 10
        response.first.must_be_instance_of Recipe
      end

    end
  #
    it "returns an empty array for a search term that does not occur in the database" do

      query = "drosophila"

      VCR.use_cassette("recipes") do
        response = EdamamApiWrapper.recipe_search_result(query)
        response.must_be_kind_of Array
        response.must_be_empty
      end
    end
  #
  end


  describe "specific_recipe(target_uri)" do

    it "gets a valid response with a good URI" do
      test_uri = "http://www.edamam.com/ontologies/edamam.owl#recipe_7bf4a371c6884d809682a72808da7dc2"
      VCR.use_cassette("recipes") do
        response = EdamamApiWrapper.specific_recipe(test_uri)
        response.must_be_instance_of Recipe
        response.source.must_equal "David Lebovitz"
      end
    end

    it "raises an error if given a bad uri" do
      test_uri = "I-Am-The-Walrus"
      VCR.use_cassette("recipes") do
        proc {
        response =  EdamamApiWrapper.specific_recipe(test_uri)
        response }.must_raise JSON::ParserError
      end
    end

  end


end
