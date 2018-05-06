require "test_helper"

require "test_helper"

describe RecipesController do
  describe 'home' do
    it "succeeds" do
      get root_path

      must_respond_with :success
    end
  end


  describe "index" do
   it "shows the search result of search" do
     search = "lemon"
     VCR.use_cassette("search") do
       EdamamApiWrapper.list_recipes(search)
       get recipes_path(query: search)
       must_respond_with :success
     end


   end

   it "doesn't show when given bad search terms" do
     search = "sdfsdfsdeaseaea"
     VCR.use_cassette("search") do
       EdamamApiWrapper.list_recipes(search)
       get recipes_path(search: search)
       must_redirect_to root_path
     end
   end
 end

  describe "show" do
    it "shows a particular recipe page" do
      VCR.use_cassette("get_recipe") do

        uri = "http://www.edamam.com/ontologies/edamam.owl%23recipe_637913ec61d9da69eb451818c3293df2"
        recipe = EdamamApiWrapper.get_recipe(uri)
        recipe.must_be_kind_of Recipe
        get recipe_path(label:name, uri: uri)
        must_respond_with :success
      end
    end
    it "renders :not_found for bad uri" do
      VCR.use_cassette("get_recipe") do

        uri = "_1111111111111"
        recipe = EdamamApiWrapper.get_recipe(uri)
        #recipe.must_equal []
        get recipe_path(label:name,uri: uri)
        must_respond_with :not_found
      end
    end

  end
end
