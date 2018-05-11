require 'test_helper'

describe Recipe do
	let(:info) {
		{
			"label" => "Apple Pie",
			"uri" => "http://www.not_a_thing_but_whatever.com",
			"url" => "http://gohuskies.com",
			"image" => "http://www.google.com",
			"ingredientLines" => ["apples", "pie"],
			"dietLabels" => ["High-Protein"],
			"healthLabels" => ["Celery-Free"]
		}
	}

	it "must make a new Recipe with valid info" do
		recipe = Recipe.new(info)
		recipe.must_be_kind_of Recipe
	end

	it "must intialize correctly" do
		recipe = Recipe.new(info)

		recipe.name.must_equal info["label"]
		recipe.uri.must_equal info["uri"]
		recipe.url.must_equal info["url"]
		recipe.image.must_equal info["image"]
		recipe.ingredients.must_equal info["ingredientLines"]
		recipe.diet_labels.must_equal info["dietLabels"]
		recipe.health_labels.must_equal info["healthLabels"]
	end

	# name(aka label) ------------------------------------------------------------
  it "raises an error if invalid name" do
    proc {
			info["label"] = nil
      Recipe.new(info)
    }.must_raise ArgumentError

		proc {
			info["label"] = "   "
			Recipe.new(info)
		}.must_raise ArgumentError

		proc {
			info["label"] = 42
			Recipe.new(info)
		}.must_raise ArgumentError
  end

	# uri ------------------------------------------------------------------------
	it "raises an error if invalid uri" do
    proc {
			info["uri"] = nil
      Recipe.new(info)
    }.must_raise ArgumentError

		proc {
			info["uri"] = "   "
			Recipe.new(info)
		}.must_raise ArgumentError

		proc {
			info["uri"] = 42
			Recipe.new(info)
		}.must_raise ArgumentError
  end

	# url ------------------------------------------------------------------------
	it "raises an error if invalid url" do
    proc {
			info["url"] = nil
      Recipe.new(info)
    }.must_raise ArgumentError

		proc {
			info["url"] = "   "
			Recipe.new(info)
		}.must_raise ArgumentError

		proc {
			info["url"] = 42
			Recipe.new(info)
		}.must_raise ArgumentError
  end

	# image ----------------------------------------------------------------------
	it "raises an error if invalid image" do
    proc {
			info["image"] = nil
      Recipe.new(info)
    }.must_raise ArgumentError

		proc {
			info["image"] = "   "
			Recipe.new(info)
		}.must_raise ArgumentError

		proc {
			info["image"] = 42
			Recipe.new(info)
		}.must_raise ArgumentError
  end

	# ingredientLines ------------------------------------------------------------
	it "raises an error if invalid ingredientLines" do
		proc {
			info["ingredientLines"] = nil
			Recipe.new(info)
		}.must_raise ArgumentError

		proc {
			info["ingredientLines"] = "   "
			Recipe.new(info)
		}.must_raise ArgumentError

		proc {
			info["ingredientLines"] = 42
			Recipe.new(info)
		}.must_raise ArgumentError
	end

	it "must allow empty ingredientLines" do
		info["ingredientLines"] = []
		recipe = Recipe.new(info)
		recipe.ingredients.must_equal info["ingredientLines"]
	end

	# dietLabels ----------------------------------------------------------------
	it "raises an error if invalid dietLabels" do
		proc {
			info["dietLabels"] = nil
			Recipe.new(info)
		}.must_raise ArgumentError

		proc {
			info["dietLabels"] = ["foo"]
			Recipe.new(info)
		}.must_raise ArgumentError

		proc {
			info["dietLabels"] = 42
			Recipe.new(info)
		}.must_raise ArgumentError
	end

	it "must allow empty dietLabels" do
		info["dietLabels"] = []
		recipe = Recipe.new(info)
		recipe.diet_labels.must_equal info["dietLabels"]
	end

	# healthLabels ---------------------------------------------------------------
	it "raises an error if invalid healthLabels" do
		proc {
			info["healthLabels"] = nil
			Recipe.new(info)
		}.must_raise ArgumentError

		proc {
			info["healthLabels"] = ["foo"]
			Recipe.new(info)
		}.must_raise ArgumentError

		proc {
			info["healthLabels"] = 42
			Recipe.new(info)
		}.must_raise ArgumentError
	end

	it "must allow empty healthLabels" do
		info["healthLabels"] = []
		recipe = Recipe.new(info)
		recipe.health_labels.must_equal info["healthLabels"]
	end

end
