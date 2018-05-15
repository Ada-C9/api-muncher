require "test_helper"

describe RecipesController do
  # it "must be a real test" do
  #   flunk "Need real tests"
  # end
  describe 'index' do
    it "can get the index path" do
      get root_path

      must_respond_with :ok
    end
  end

  describe 'show' do
    it 'can get the show path' do
      get show_recipes_path

      must_respond_with :ok
    end


  end

end
