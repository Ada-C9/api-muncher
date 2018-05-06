require 'test_helper'

describe "RecipeApiWrapper" do
  it 'gives a list of recipes' do
    VCR.use_cassette('recipes') do
      query = 'broccoli'

      recipe_list = RecipeApiWrapper.recipes(query)

      recipe_list.each do |recipe|
        recipe.must_be_kind_of Recipe
      end
    end
  end


  # would I need something to test if its an actual recipe?
  # How would a prove a recipe vs a non recipe?
  # would I use the information given back in the query in which case isnt that already tested?

  it "raises and error if query is empty" do
    VCR.use_cassette('recipes') do
    query = ' '

    proc {
      RecipeApiWrapper.recipes(query)
    }.must_raise RecipeApiWrapper::RecipeError
  end
end

end
