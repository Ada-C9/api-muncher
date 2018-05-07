require "test_helper"

describe RecipesController do
  describe "index" do
    it "can return list of matching recipes" do
      VCR.use_cassette("index_action") do
        get root_path
        must_respond_with :success
      end
    end
  end

  describe "show" do
    it "can show one individual recipe" do
      VCR.use_cassette("show_action") do
        uri = "http://www.edamam.com/ontologies/edamam.owl#recipe_7bf4a371c6884d809682a72808da7dc2"
        uri = URI.escape(uri)
        recipe = EdamamApiWrapper.find_recipe(uri)
        get recipes_show_path("Teriyaki Chicken"), params: {uri: recipe.uri}
        must_respond_with :success
      end
    end

  it "will send bad_request if message sent to fake recipe page" do
        VCR.use_cassette("create_action_bad") do
          uri = "http://www.edamam.com/ontologies/edamam.owl#recipe_7bf4a371c6884d809682a72808da7dc2"
          get recipes_show_path("mop"), params: {uri: uri}
          must_respond_with :not_found

        end
      end
    end

end
