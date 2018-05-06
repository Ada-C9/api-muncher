require "test_helper"

require "test_helper"

describe RecipesController do
  describe 'home' do
    it "succeeds" do
      get root_path

      must_respond_with :success
    end
  end

  describe 'index' do
    it "succeeds when valid query is provided only" do
      VCR.use_cassette("recipes") do
        get root_path, params: {
          query: "tofu"
        }

        must_respond_with :success
      end
    end
  end

  it "should get show" do
    VCR.use_cassette("recipes") do
      recipe_uri = "http://www.edamam.com/ontologies/edamam.owl%23recipe_9b5945e03f05acbf9d69625138385408"
      get recipe_path(uri: recipe_uri)

      must_respond_with :success
    end
  end
end
