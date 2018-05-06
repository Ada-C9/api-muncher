require "test_helper"

describe RecipeController do
  it "should get index" do
    get recipe_index_url
    value(response).must_be :success?
  end

  it "should get new" do
    get recipe_new_url
    value(response).must_be :success?
  end

  it "should get show" do
    get recipe_show_url
    value(response).must_be :success?
  end

  it "should get edit" do
    get recipe_edit_url
    value(response).must_be :success?
  end

  it "should get update" do
    get recipe_update_url
    value(response).must_be :success?
  end

  it "should get destroy" do
    get recipe_destroy_url
    value(response).must_be :success?
  end

  it "should get create" do
    get recipe_create_url
    value(response).must_be :success?
  end

end
