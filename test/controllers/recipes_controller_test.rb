require "test_helper"

describe RecipesController do

  describe 'index' do
    it "Should get a list of Recipes when give a term" do
      VCR.use_cassette("controller") do

        get search_results_path, params: { query: "eggs" }
        must_respond_with :success
      end
    end

    it 'Should ' do

    end

  end

  describe 'show' do
    it "should render 404 for bogus recipe id and redirect to root page" do
       VCR.use_cassette("controller") do
         # recipe = EdamamApiWrapper.find("nil")
         get recipe_path("nil")

         flash[:alert].must_equal "Invalid recipe."
         must_respond_with :redirect
         must_redirect_to root_path
       end

     end
  end
end
