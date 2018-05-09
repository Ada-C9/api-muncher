require "test_helper"

describe RecipesController do
  it "can get the index path" do
    get root_path

    must_respond_with :ok
  end

end
