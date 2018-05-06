require 'test_helper'

describe Recipe do
  it "Raises an error if params are missing" do
    proc {
      Recipe.new
    }.must_raise ArgumentError

    proc {
      Recipe.new('title')
    }.must_raise ArgumentError

  end

  it "Must initialize params properly" do
    recipe = Recipe.new('id', 'title', 'image', 'link', 'source', 'ingredients', 'dietlabels' )
    recipe.id.must_equal 'id'
    recipe.title.must_equal 'title'
    recipe.ingredients.must_equal 'ingredients'
  end

end
