require 'test_helper'

describe Recipe do

  it "cannot be initialized with fewer than 6 parameters" do
    proc {
      Recipe.new
    }.must_raise ArgumentError

    5.times do | num_args |
      test_argument = "test"
      arguments = {}
      num_args.times do | arg |
        arguments[arg] = test_argument
      end
      proc {
        Recipe.new(arguments)
      }.must_raise ArgumentError
    end

  end # it do

  it "must initialize arguments properly" do
    recipe = Recipe.new("Fish Taco", "http://lorempixel.com/400/200/", ["tortilla", "fish"], ["gluten-free", "pescatarian"], "https://www.google.com/", "7ioe0235mxo0eio05234b63h26r2463c6")
    recipe.name.must_equal "Fish Taco"
    recipe.photo_url.must_equal "http://lorempixel.com/400/200/"
    recipe.ingredients.must_equal ["tortilla", "fish"]
    recipe.dietary_labels.must_equal ["gluten-free", "pescatarian"]
    recipe.original_recipe_url.must_equal "https://www.google.com/"
    recipe.uri_id.must_equal "7ioe0235mxo0eio05234b63h26r2463c6"
  end # it do 

end # Recipe
