require "test_helper"

describe UsersController do
  describe 'show' do
    it 'sends success for a logged in user' do
      user = users(:one)

      login(user)

      get user_path(user.id)

      must_respond_with :success
    end

    it 'redirects a user that is not logged in' do
      get user_path(users(:one).id)

      must_respond_with :redirect
    end
  end
end
