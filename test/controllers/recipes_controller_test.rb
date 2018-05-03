require "test_helper"

describe RecipesController do
  describe 'root' do
    it 'must return success' do
      get root_path

      must_respond_with :success
    end
  end

  describe 'index' do
    it 'must return success for multiple recipes' do
      VCR.use_cassette('recipes') do
        get recipes_path, params: {query: 'chicken'}

        must_respond_with :success
      end
    end

    it 'must return success for no recipes' do
      VCR.use_cassette('recipes') do
        get recipes_path, params: {query: 'some-non-indexed-dish'}

        must_respond_with :success
      end
    end
  end

  describe 'show' do
    it 'must return success for a real uri' do
      VCR.use_cassette('recipes') do
        get recipe_path, params: {uri: 'http://www.edamam.com/ontologies/edamam.owl#recipe_7bf4a371c6884d809682a72808da7dc2'}

        must_respond_with :success
      end
    end

    it 'must do something else for a not uri' do
      skip
    end
  end
end
