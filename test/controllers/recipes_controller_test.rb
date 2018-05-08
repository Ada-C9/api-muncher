require 'test_helper'

describe RecipesController do
  describe 'index' do
    it "can get the homepage path" do
      get root_path
      must_respond_with :success
    end

    it "can get the index path" do
      VCR.use_cassette("recipes") do
        get recipes_path, params: {user_input: "avocado"}
        must_respond_with :success
      end
    end

    it 'fails with nonsensical input' do
      VCR.use_cassette("recipes") do
        proc {get recipes_path, params: {user_input: "thesetestsarenotpassing"} }. must_raise
      end
    end

    it 'succeeds with valid data' do
      VCR.use_cassette("recipes") do
        get recipes_path, params: {user_input: "tortilla"}
        must_respond_with :success
      end
    end
  end

  describe 'show' do
    it "succeeds in getting a real recipe" do
      VCR.use_cassette("recipes") do
        uri = 'b1a783e4ad64f147e4bf3344464602c6'

        get recipe_path(uri)
        must_respond_with :success
      end
    end

    it "fails with an invalid search" do
      VCR.use_cassette("recipes") do
        proc {
          get recipe_path(thiswillnotwork) }.must_raise
      end
    end
  end

end
