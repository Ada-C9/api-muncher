require 'test_helper'

describe EdamamApiWrapper do
  before do
    @search_term = "egg"
    @bogus_search_term = "hfkhf"
  end

  describe 'list_of_recipes' do
    it 'gives a list of recipes' do

      VCR.use_cassette('recipes') do
        recipes = EdamamApiWrapper.list_of_recipes(@search_term)

        recipes.each do |recipe|
          recipe.must_be_kind_of Recipe
        end

      end
    end #it gives a list of recipes

    it 'will return an empty array for a bad request' do
      VCR.use_cassette('recipes') do
        recipes = EdamamApiWrapper.list_of_recipes(@bogus_search_term)

        recipes.each do |recipe|
          recipe.must_be_kind_of Recipe
        end

      end
    end

    it "Will return an empty array for invalid app_id and app_key" do
      VCR.use_cassette("recipes") do
        recipes = EdamamApiWrapper.list_of_recipes(@search_term, "wrong_app_id", "wrong_app_key")
        recipes.must_be_instance_of Array
        recipes.must_equal []
      end
    end


  end # describe list_of_recipes


end # class EdamamApiWrapper
