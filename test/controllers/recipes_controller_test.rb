require "test_helper"

describe RecipesController do

  it "can get the search path" do
    get search_path  
    must_respond_with :ok
  end

  # it "can get the recipes index" do
  # end

end
