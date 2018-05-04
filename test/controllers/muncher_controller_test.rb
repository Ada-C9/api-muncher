require "test_helper"

describe MuncherController do

  describe 'search' do

    it "should succeed" do
      get root_path
      must_respond_with :success
    end
  end

  describe 'index' do

    it "should succeed with some matches to the query" do
      VCR.use_cassette("recipe") do
        get muncher_index_path
        recipes = EdamamApiWrapper.list_recipes("chicken")
        must_respond_with :ok
      end
      must_respond_with :success
    end

    it "should redirect to root path with nil or empty string" do
      VCR.use_cassette("recipe") do
        get muncher_index_path
        recipes = EdamamApiWrapper.list_recipes("")
        must_respond_with :ok
      end
      must_respond_with :redirect
      must_redirect_to root_path
    end
  end

  describe 'show' do

    it "should succeed with a valid uri" do
      VCR.use_cassette("recipe") do
        recipes = EdamamApiWrapper.list_recipes("chicken")
        get muncher_path("7bf4a371c6884d809682a72808da7dc2")
      end
      must_respond_with :success
    end

    it "should redirect to the root path with a bogus uri" do
      VCR.use_cassette("recipe") do
        recipes = EdamamApiWrapper.list_recipes("chicken")
        get muncher_path("kgljv")
      end
      must_respond_with :redirect
      must_redirect_to root_path
    end
  end


end
