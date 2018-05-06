require "test_helper"

describe RecipesController do

  describe 'index' do
    it 'can get the index path' do
      get root_path
      must_respond_with :ok
    end # it do

    it 'can get recipes from a search' do
      VCR.use_cassette("recipes") do
        get recipes_path, params: { search: 'naseu' }
        must_respond_with :ok
      end
    end # it do
  end # index

  describe 'show' do
  end

end # RecipesController
