require 'test_helper'

# this needs to be done in controller testing?

describe PagesController do
  describe "index" do
    it "can get the root path" do
      get root_path
      must_respond_with :success
    end
  end
end
