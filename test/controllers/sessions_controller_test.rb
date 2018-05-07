require "test_helper"

describe SessionsController do
  describe "create" do
    it "can login" do
      user = User.first
      login(user)

      user_id = session[:user_id]

      user_id.must_equal user.id
    end
  end

  describe "logout" do
    it "ends the session" do
      user = users(:ada)
      login(user)

      user_id = session[:user_id]

      user_id.must_equal user.id

      delete logout_path, params: {user_id: user_id}
      user_id = session[:user_id]

      user_id.must_be_nil
    end
  end
end
