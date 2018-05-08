require "test_helper"

describe SessionsController do
  before do
    @jay = User.create(username:"jay-z",email:"jayz@gmail.com", uid: 132123)
    @foyal = User.create(username:"foyal2code",email:"coder@gmail.com", uid: 989898)
    @ada = User.create(username:"adaluv",email:"adaluv@gmail.com", uid: 981234)
  end

  describe 'Log-in' do
    it 'will allow a user to re-log in and redirect to query_results_path w/o affecting User count' do
      current_number_of_users = User.count

      user = @jay
      login(user)
      session[:user_id].must_equal @jay.id
      User.count.must_equal current_number_of_users
      flash[:message].must_equal "Logged in successfully, welcome back #{@jay.username}"
      flash[:status].must_equal :success
    end

    it 'will allow a new user to log in and create an account' do
      current_number_of_users = User.count
      user = User.new( uid: 202020202, username: "test",
				email: "ignore@gmail.com")
      OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new(mock_auth_hash(user))
			get auth_callback_path(:github)

      flash[:status].must_equal :success
      flash[:message].must_equal "Your account has been generated #{user.username}!"

      User.count.must_equal current_number_of_users+1
      session[:user_id].must_equal User.last.id
      must_respond_with :redirect
      must_redirect_to query_results_path
    end

    it 'will redirect to query_results if given bad data' do
      user = User.new( uid: 202020202, username: nil,
				email: "ignore@gmail.com")

        OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new(mock_auth_hash(user))
  			get auth_callback_path(:github)

        must_redirect_to query_results_path
        flash[:status].must_equal :failure
        flash[:message].must_equal "Something has gone wrong in the account generation process."
    end
  end

  describe 'Logout' do
    it 'will logout a logged in user' do
      user = @ada
      login(user)
      session[:user_id].must_equal @ada.id

      get signout_path
      session[:user_id].must_be_nil
      flash[:status].must_equal :success
      flash[:message].must_equal "You've logged out"

      must_respond_with :redirect
      must_redirect_to query_results_path
    end

    it 'will not change the status of guest user' do
      get signout_path
      must_respond_with :redirect
      must_redirect_to root_path
    end

  end

end
