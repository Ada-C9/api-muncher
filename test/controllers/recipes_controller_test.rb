require "test_helper"

describe RecipesController do

  describe "search" do

    it "should run successfully" do
      get recipes_search_path
      value(response).must_be :successful?
    end

  end

  describe "index" do

    it "should run successfully with a valid search term" do

      VCR.use_cassette("recipes_controller") do
        get recipes_path params: {query: "chicken"}
        value(response).must_be :successful?
      end

    end

    it "should return an appropriate message if it runs successfully but returns zero results" do

      VCR.use_cassette("recipes_controller") do
        get recipes_path params: {query: "nematodes"}
        value(response).must_be :successful?
        flash[:result_text].must_equal "Your chosen foodstuff is too mëtäl for this app and has returned zero search results."
      end
    end

    # it "should return an error for an invalid search" do
    #
    #   # I WOULD LIKE TO DO THIS, BUT I CAN'T, BECAUSE IF YOU GIVE IT A TRULY EFFED-UP QUERY, IT WILL JUST CRASH THE APP.
    #
    #   bad_query =  EdamamApiWrapper.recipe_search_result("chocolate")
    #
    #   VCR.use_cassette("recipes_controller") do
    #     get recipes_path params: {query: bad_query}
    #     value(response).must_be :failure
    #     flash[:result_text].must_equal "The raw power of your search has caused this app to fail."
    #   end
    #
    # end


  end

  describe "detail" do

    it "should run successfully with a valid uri" do

      test_uri = "http://www.edamam.com/ontologies/edamam.owl#recipe_7672acaa8a7d579023657aa9e7674daf"
      VCR.use_cassette("recipes_controller") do
        get recipes_detail_path params: {uri_wanted: test_uri}
        value(response).must_be :successful?
      end
    end

    it "should provide appropriate error messages and redirect if run with a bad URI" do

      test_uri = "https://en.wikipedia.org/wiki/Doughnut"
      VCR.use_cassette("recipes_controller") do
        get recipes_detail_path params: {uri_wanted: test_uri}
        must_redirect_to root_path
      end

    end
  end

end
