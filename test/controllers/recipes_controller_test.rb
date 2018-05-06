require "test_helper"
require 'pry'

describe RecipesController do

  describe 'index' do
    it "should get index path" do
      VCR.use_cassette("recipes") do
        get recipes_path
      end

      must_respond_with :ok
    end

  end

  describe 'show' do
    # it "should get show path" do
    #   VCR.use_cassette("recipes") do
    #     get action: 'show', :id =>   URI.parse('http://www.edamam.com/ontologies/edamam.owl#recipe_7bf4a371c6884d809682a72808da7dc2')
    #   end
    #   #
    #   must_respond_with :ok
    # end

  end

  describe 'root' do
    it 'should get the root path' do
      get home_path

      must_respond_with :ok
    end

  end

end
