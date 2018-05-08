require 'test_helper'

describe Recipe do
  it 'Cannot be initialzed without a parameter' do
    proc{
      Recipe.new
    }.must_raise ArgumentError
  end
   it 'Will be initialized with a valid hash parameter' do
     a_recipe = {
       "uri" => "http:google.com",
       "label" => "a thing",
       "image" => "http:www.google.com/image",
       "url" => "http:google.com",
       "source" => "google",
       "ingredientLines" => "none",
       "calories" =>  100,
       "totalNutrients" => "none"
     }
     recipe = Recipe.new(a_recipe)
     recipe.class.must_equal Recipe

     recipe.uri.must_equal "http:google.com"
     recipe.label.must_equal "a thing"
     recipe.image.must_equal "http:www.google.com/image"
     recipe.url.must_equal "http:google.com"
     recipe.source.must_equal "google"
     recipe.ingredientLines.must_equal "none"
     recipe.calories.must_equal 100
     recipe.totalNutrients.must_equal "none"
   end
end
