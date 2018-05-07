require "test_helper"

describe RecipesController do
  describe 'new' do
    it 'responds with success' do
      get root_path

      must_respond_with :success
    end

  end

  describe 'index' do

    it 'responds with success with valid data' do
      VCR.use_cassette("recipes") do
        get recipes_path, params: {query: "cheese"}

        must_respond_with :success
      end
    end


    it 'raises an error with invalid data' do

        VCR.use_cassette("recipes") do
        proc {
          get recipes_path }.must_raise
      end

    end

  end

  describe 'show' do

    it 'responds with success with valid data' do
      VCR.use_cassette("recipe") do
        get recipe_path("9b5945e03f05acbf9d69625138385408")

        must_respond_with :success
      end
    end

    it 'raises an error with invalid data' do
      VCR.use_cassette("recipe") do
        proc {
          get recipe_path(owwwww) }.must_raise
      end
    end

  end
end
