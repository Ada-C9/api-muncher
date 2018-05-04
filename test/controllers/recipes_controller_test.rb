require "test_helper"

describe RecipesController do
  describe "index" do
    it "can show a list of recipes with desired flavor" do
      VCR.use_cassette("recipes") do
        get recipes_path, params: {flavor: "tofu"}
        must_respond_with :success
      end
    end

    it "can show results for unreasonable flavor" do
      VCR.use_cassette("recipes") do
        get recipes_path, params: {flavor: "whateveriwant-dne"}
        must_respond_with :success
      end
    end
  end

  describe "show" do
    it "can show a real recipe" do
      VCR.use_cassette("recipes") do
        uri = "4e293950d34375d4ecae2d1c7bb72c56"
        get show_recipe_path(uri)
        must_respond_with :success
      end
    end

    it "can not show a recipe DNE" do
      VCR.use_cassette("recipes") do

        fake_uri = "4e29jshfr3343daadak;jdjladda75d4ecae2d1c7bb72c56"
        # binding.pry
        proc {
          get show_recipe_path(fake_uri)
        }.must_raise ArgumentError
      end
    end
  end
end
