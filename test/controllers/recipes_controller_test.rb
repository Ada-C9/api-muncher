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

    it 'succeeds with a blank search' do
      VCR.use_cassette("recipes") do
        get recipes_path, params: { search: '' }
        must_respond_with :ok
      end
    end # it do

    it 'succeeds with a bogus search' do
      VCR.use_cassette("recipes") do
        get recipes_path, params: { search: 'xxxxxxxxxxxxxxxxx' }
        must_respond_with :ok
      end
    end # it do

  end # index

  describe 'show' do
    it 'can get a recipe that exists' do
      VCR.use_cassette("recipe") do
        uri_id = "2b4b94d566015f1edaadcb4397ba0422"
        get recipe_path(uri_id)

        must_respond_with :ok
      end
    end # it do

    it 'raises an error for an recipe that DNE' do
      VCR.use_cassette("bad_recipe") do
        uri_id = "x"
        proc { get recipe_path(uri_id) }.must_raise
      end
    end # it do
  end # show

end # RecipesController
