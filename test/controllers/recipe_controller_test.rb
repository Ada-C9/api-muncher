require "test_helper"

describe RecipeController do
  before do
    @jay = User.create(username:"jay-z",email:"jayz@gmail.com", uid: 132123)
  end
  describe 'Logged-in User' do
    before do
      login(@jay)
    end
    describe "Root" do
      it 'will get to the root' do
        session[:user_id].must_equal @jay.id
        get root_path
        must_respond_with :ok
      end
    end

    describe "Index" do
      it 'will display index for a search request' do
        session[:user_id].must_equal @jay.id
        VCR.use_cassette("Recipe-controller:query-path") do
          get query_results_path,params: {query:"chicken"}
          must_respond_with :ok
          flash[:status].must_equal :success
          flash[:message].must_equal "Sucecssfully found chicken recipes."
        end
      end

      it 'will display index for query within a specific range' do
        session[:user_id].must_equal @jay.id
        VCR.use_cassette("Recipe-controller:recipe-query-range") do
          get query_results_path, params: {from:"1", to: "5", query: "corn"}
          must_respond_with :ok
        end
      end

      it 'will display a message to the user if a recipe query yields no results' do
        session[:user_id].must_equal @jay.id
        VCR.use_cassette("recipe-query-no-result") do
          get query_results_path, params: {query: "jjjjj"}
          flash[:status].must_equal :error
          flash[:message].must_equal "We currently do not have any jjjjj recipes."
        end
      end
    end
    describe 'Show' do
      it 'will show details of a recipe' do
        #issues with setting up this test
        session[:user_id].must_equal @jay.id
        VCR.use_cassette("recipe-show") do
          get recipe_show_path, params: {uri: "http%3A%2F%2Fwww.edamam.com%2Fontologies%2Fedamam.owl%23recipe_7bf4a371c6884d809682a72808da7dc2"}

          must_respond_with :ok
        end
      end
    end

  end
  describe 'Guest User' do
    it 'can view the homepage' do
      get root_path
      must_respond_with :success
    end

    it 'can conduct a search' do
      VCR.use_cassette("Recipe-controller:query-path") do
        get query_results_path,params: {query:"pizza"}
        must_respond_with :ok
        flash[:status].must_equal :success
        flash[:message].must_equal "Sucecssfully found pizza recipes."
      end
    end

    it 'will not be able to access show page' do
      VCR.use_cassette("recipe-show") do
        get recipe_show_path, params: {item: {uri: "http%3A%2F%2Fwww.edamam.com%2Fontologies%2Fedamam.owl%23recipe_7bf4a371c6884d809682a72808da7dc2"}}
        must_respond_with :redirect
        must_redirect_to root_path
      end
    end
    #ability to sign in is covered by sessions testing - correct?
  end
end
