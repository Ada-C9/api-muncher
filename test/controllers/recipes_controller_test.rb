require "test_helper"

describe RecipesController do
  it "should get index" do
    VCR.use_cassette("recipes") do
      get recipes_path(q: "chicken")
      must_respond_with :success
    end
  end

    it "must get results page when there are no results" do
      VCR.use_cassette("recipes") do
        get recipes_path(q: "")
        must_respond_with :success
      end
    end

    it "should get show" do
      VCR.use_cassette("recipes") do
        recipe_uri = "http://www.edamam.com/ontologies/edamam.owl%23recipe_9b5945e03f05acbf9d69625138385408"
        get recipe_path(uri: recipe_uri)

        must_respond_with :success
      end
    end

    it "renders 404 if the recipe is not found" do
      VCR.use_cassette("recipes") do
        fake_uri = "http://www.edamam.com/ontologies/edamam.owl%23recipe_fake-uri"
        get recipe_path(uri: fake_uri)

        must_respond_with :missing
      end
    end


    it "should get search" do
      get root_path
      must_respond_with :success
    end
    
  end
