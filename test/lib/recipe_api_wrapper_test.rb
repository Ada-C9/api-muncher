require 'test_helper'


describe RecipeApiWrapper do
  describe 'list_of_queried_recipes' do
    it 'can query a valid recipe' do
      VCR.use_cassette("recipe-query") do
        a_recipe = "chicken"
        response = RecipeApiWrapper.list_of_queried_recipes(a_recipe)

        #recieve expected data structure and size
        response.class.must_equal Array
        response.size.must_equal 10

        #recieve expected response
        response[0].label.must_equal "Teriyaki Chicken"
        response[0].source.must_equal "David Lebovitz"
        response[9].label.must_equal "Roast Chicken"
        response[9].source.must_equal "Fine Cooking"
      end
    end

    it 'will return an empty array for recipe that cannot be found by API' do
      VCR.use_cassette("empty-array-check") do
        a_recipe = "alfkjalkdfjalsdkjfalkdjf"
        response = RecipeApiWrapper.list_of_queried_recipes(a_recipe)
        response.must_be_empty
      end
    end
    it 'will return [] if input is not of class string' do
      VCR.use_cassette("query-must-be-string") do
        a_recipe = 44
        response  = RecipeApiWrapper.list_of_queried_recipes(a_recipe)
        response.must_be_empty
      end
    end


    describe 'a_recipe' do
      it 'can query for a valid recipe item' do
        #expected fields exist from object that is created .
        VCR.use_cassette("single-recipe-query") do
          a_recipe = "http://www.edamam.com/ontologies/edamam.owl#recipe_bbdb996ddc7cf771c863538e02ed13c4"
          response = RecipeApiWrapper.a_recipe(a_recipe)

          #recieve expected object type
          response.class.must_equal Recipe

          #recieve expected response
          response.label.must_equal "Pizza"
          response.source.must_equal "Cooking Channel"
        end
      end
      it 'will return [] for a recipe search that is not of string type' do
        VCR.use_cassette("recipe-is-a-string") do
          a_recipe = 44
          response  = RecipeApiWrapper.a_recipe(a_recipe)
          response.must_be_empty
        end
      end

    end
  end
  describe 'limited_query' do
    it 'will return [] for non-string input for single-recipe search' do
      VCR.use_cassette("not-string-type-check") do
        a_recipe = 4
        response = RecipeApiWrapper.a_recipe(a_recipe)
        response.must_be_empty
      end
    end
    it 'can query a valid recipe within a specific range' do
      # sample query with expected first and last range id exist
      #expected names are displayed
      VCR.use_cassette("recipe-query-specific-range") do
        a_recipe = "lime"
        from = "4"
        to = "10"

        response = RecipeApiWrapper.limited_query(a_recipe,from,to)

        #recieve expected data structure and size
        response.class.must_equal Array
        response.size.must_equal 6

        #recieve expected response
        response[0].label.must_equal "Lime Ginger Iced Tea"
        response[5].label.must_equal "Raspberry Lime Popsicles"
      end
    end

    it 'query w/specific range that are negative will return []' do
      VCR.use_cassette("must-be-positive") do
        a_recipe = "lime"
        from = "-4"
        to = "-5"
        response = RecipeApiWrapper.limited_query(a_recipe,from,to)
        #recieve expected data structure and size
        response.class.must_equal Array
        response.must_be_empty
      end

    end

    it 'query w/specific range that are nil will return []' do
      VCR.use_cassette("must-not-be-nil") do
        a_recipe = "lime"
        from = nil
        to = nil

        response = RecipeApiWrapper.limited_query(a_recipe,from,to)

        #recieve expected data structure and size
        response.class.must_equal Array
        response.must_be_empty
      end
    end

    it 'query w/specific range that are not of type String will return []' do
      VCR.use_cassette("must-be-Integer") do
        a_recipe = "lime"
        from = 4
        to = 5

        response = RecipeApiWrapper.limited_query(a_recipe,from,to)

        #recieve expected data structure and size
        response.class.must_equal Array
        response.must_be_empty
      end
    end
  end

end
