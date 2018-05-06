require 'test_helper'

describe EdamamApiWrapper do

  describe 'find_recipes' do
    it "Receives a list of recipes from Edamam when given a search-term" do
      VCR.use_cassette("recipes") do
        response = EdamamApiWrapper.find_recipes("chicken")

        response.must_be_kind_of Array
        assert response.any?
      end
    end

    it "Can receive valid data from Edamam for a recipe and record it in a array of Recipe objects" do
      VCR.use_cassette("recipes") do
        response = EdamamApiWrapper.find_recipes("chicken")

        response[0].must_be_kind_of Recipe
        # assert response.any?
      end
    end
  end

  describe 'find' do
    it "Can find a recipe when given an ID" do
      VCR.use_cassette("recipes") do
        # Arrange
        teriyaki_chicken_id = "7bf4a371c6884d809682a72808da7dc2"

        # Act
        response = EdamamApiWrapper.find(teriyaki_chicken_id)

        # Assert
        response.must_be_kind_of Recipe
        response.title.must_equal "Teriyaki Chicken"
        response.id.must_equal teriyaki_chicken_id
      end
    end

    it "Returns nil when given a bogus ID" do
      VCR.use_cassette("recipes") do
        # Arrange
        list_recipes = EdamamApiWrapper.find_recipes("chicken")

        # Act
        response = EdamamApiWrapper.find("wrong id")
        # proc{response = EdamamApiWrapper.find("wrong id")}.must_raise ActionController::RoutingError will be tested on controller tests

        # Assert
        response.must_equal nil
      end
    end

  end

end
