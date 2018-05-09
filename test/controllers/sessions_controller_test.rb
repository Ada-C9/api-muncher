require "test_helper"

describe SessionsController do
  describe 'create' do
    before do
      @user_count = User.count
    end

    it 'logs in a new user' do
      user = User.new(
        uid: '999999',
        provider: 'google',
        name: 'test user',
        email: 'test@test.com'
      )
      user.valid?.must_equal true
      login(user)

      User.count.must_equal @user_count + 1
      User.last.name.must_equal 'test user'
      must_redirect_to user_path(User.last.id)
    end

    it 'logs in an already existing user' do
      user = users(:one)

      login(user)

      session[:user_id].must_equal user.id
      must_redirect_to user_path(users(:one).id)
      User.count.must_equal @user_count
    end

    it 'does not log in a user twice' do
      # I'm not sure how to demonstrate this
      user = users(:one)

      login(user)
      # should now be at users#show
      session[:user_id].must_equal user.id

      login(user)
    end

    it 'does not let a user login as another user' do
      user = users(:one)

      login(user)
      session[:user_id].must_equal user.id

      login(users(:two))
      session[:user_id].must_equal user.id
    end
  end

  describe 'destroy' do
    it 'logs out a logged in user' do
      user = users(:one)

      login(user)
      session[:user_id].must_equal user.id

      delete logout_path
      session[:user_id].must_be_nil
    end

    it 'redirects to root if no user is logged in' do
      delete logout_path
      must_redirect_to root_path
    end
  end
end
