require "test_helper"

describe RecipesController do

  describe 'homepage' do
    it "succeeds" do
      get root_path

      must_respond_with :success
    end
  end

  describe "index" do
    it "succeeds when valid ingredient is provided" do
      VCR.use_cassette("recipes") do
        get recipes_path, params: {
          ingredient: "tofu"
        }

        must_respond_with :success
      end
    end

    it "can show results for unreasonable ingredient" do
      VCR.use_cassette("recipes") do
        get recipes_path, params: {
          ingredient: "chinese food"
        }

        must_respond_with :success
      end
    end

  end

  describe "show" do
    it "succeeds when valid 'ingredient' is provided" do
      VCR.use_cassette("recipes") do
        recipe = RecipeApiWrapper.list_recipes("chicken").first

        recipe_id = recipe.uri.split("_")[1]

        get show_recipe_path(recipe_id)

        must_respond_with :success
      end
    end

    it "redirects to index page for invalid recipe id" do
      VCR.use_cassette("recipes") do
        invalid_recipe_id = "8875432qsdfghj87653579hhsadf"

        get show_recipe_path(invalid_recipe_id)

        flash[:status].must_equal :failure
        flash[:message].must_equal "API called failed: invalid input. Please try again."
        must_respond_with :redirect
        must_redirect_to root_path
      end
    end
  end


end
