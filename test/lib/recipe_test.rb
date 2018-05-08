require 'test_helper'

describe Recipe do

  it "Raises an error if does not have at least one argument" do
    proc {
      Recipe.new
    }.must_raise ArgumentError
  end

  it "Return a type error if argument is not a hash" do
    proc {
      Recipe.new("String")
    }.must_raise TypeError

  end

  it "Returns argument error is hash is empty" do

    proc {
      Recipe.new({})
    }.must_raise ArgumentError
  end

  it "Must initialize required fields properly." do

    info_hash = {
      title: "A recipe",
      id: ("recipe_1234").match(/[^_]*$/)[0],
      image: "image_url",
      source: "Somebody",
      url: "source_url",
      portion: "4",
      ingredients: ["Water", "Air"],
      diet: ["Healthy", "No sugar"]
    }

    recipe = Recipe.new(info_hash)

    recipe.title.must_equal "A recipe"
    recipe.id.must_equal "1234"
    recipe.image.must_equal "image_url"
    recipe.source.must_equal "Somebody"
    recipe.url.must_equal "source_url"
    recipe.portion.must_equal "4"
    recipe.ingredients.must_equal ["Water", "Air"]
    recipe.diet.must_equal ["Healthy", "No sugar"]
  end

end
