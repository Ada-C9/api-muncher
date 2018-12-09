require "test_helper"

describe RecipesController do
  describe "#home" do
    it "successfully loads home page" do
      get root_path
      must_respond_with :ok
    end

    it "stays on home page if search term is an empty string" do
      VCR.use_cassette("recipes") do
        get root_path(search: " ")
        must_respond_with :ok
      end
    end
  end

  describe "#index" do

    it "successfully loads recipe results for any search term" do

      VCR.use_cassette("recipes") do
        get recipes_path(search_term: "sushi")
        must_respond_with :ok
      end

      VCR.use_cassette("recipes") do
        get recipes_path(search_term: "%%")
        must_respond_with :ok
      end
    end

    it "redirects to home page if search term is blank" do
      VCR.use_cassette("recipes") do
        get recipes_path(search_term: "  ")
        flash[:status].must_equal :failure
        flash[:message].must_equal "Please enter a search term"
        must_redirect_to root_path
      end
    end
  end

  describe "#show" do

    it "shows a recipe page" do
      VCR.use_cassette("recipes") do
        uri = "7bf4a371c6884d809682a72808da7dc2"
        get recipe_path(id: "recipe_label", uri: uri )
        must_respond_with :success
      end
    end

    it "renders 404 if the recipe page is not found" do
      VCR.use_cassette("recipes") do
        bogus_uri = "7bf4a371c6884d809682a72808da7dc2;218981"

        get recipe_path(bogus_uri)

        must_respond_with :missing
      end
    end

  end
end
