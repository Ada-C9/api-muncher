require "test_helper"

describe RecipesController do
  it "can get the search path" do
    get root_path

    must_respond_with :ok
  end

  it "can get the recipe show view" do
    VCR.use_cassette('Slider') do
      slider_uri = "#recipe_3765ec2ac5aa6523a30b59203fe64883"
      get show_path(slider_uri)

      must_respond_with :success
    end
  end

  it "handles an invalid request" do
    VCR.use_cassette('Slider') do
      slider_uri = "#recipe_slider"
      proc { get show_path(slider_uri)}.must_raise

    end
  end

  it "can add a query" do
    VCR.use_cassette('chicken') do
      get results_path('chicken')

      must_respond_with :success
    end
  end

  it "alerts the user if no results are found" do
    VCR.use_cassette('chicken') do
      get results_path('Europa')

      result = flash[:status]

      must_redirect_to root_path
      result.must_equal :failure
    end
  end
end
