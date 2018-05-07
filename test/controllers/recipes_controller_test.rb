require "test_helper"

describe RecipesController do

  it "can get the index path" do
    VCR.use_cassette("recipes") do
      get recipes_path, params: {message: "chicken"}
      must_respond_with :success
    end
  end

  it 'fails with nonsensical input' do
      VCR.use_cassette("recipes") do
        proc {get recipes_path, params: {food: "hello"} }. must_raise
      end
    end


  it "can get the main path" do
    get root_path

    must_respond_with :success
  end

  it "can get the show path" do
    VCR.use_cassette("recipes") do
        uri = '9b5945e03f05acbf9d69625138385408'

        get recipe_path(uri)
        must_respond_with :success
      end
  end
end
