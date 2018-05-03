require "test_helper"

describe RecipesController do
  # it "must be a real test" do
  #   flunk "Need real tests"
  # end

  it "can get the index path" do
  get root_path

  must_respond_with :ok
end

it "can get the new recipe form" do
  get new_search_path

  must_respond_with :ok
end

end
