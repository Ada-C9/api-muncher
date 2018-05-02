require "test_helper"

describe MuncherController do
  it "should get index" do
    get muncher_index_url
    value(response).must_be :success?
  end

  it "should get show" do
    get muncher_show_url
    value(response).must_be :success?
  end

end
