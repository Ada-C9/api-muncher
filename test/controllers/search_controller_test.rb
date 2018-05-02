require "test_helper"

describe SearchController do
  it "should get new" do
    get search_new_url
    value(response).must_be :success?
  end

  it "should get index" do
    get search_index_url
    value(response).must_be :success?
  end

  it "should get show" do
    get search_show_url
    value(response).must_be :success?
  end

end
