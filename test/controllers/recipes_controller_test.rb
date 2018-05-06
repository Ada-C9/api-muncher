require "test_helper"

describe RecipesController do


  describe "index" do
    it "succeeds when there are recipes" do
      # Assumption instead of Arrange
      # Check your assumption
      User.count.must_be :>, 0

      # Act
      get users_path

      # Assert
      must_respond_with :success
    end
  end

  describe "show" do
    it "succeeds for an extant user ID" do
      login(@user)

      get user_path(@user.id)

      must_respond_with :success
    end

    it "renders 404 not_found for a bogus user ID" do
      login(@user)

      user_id = User.last.id + 1

      get user_path(user_id)

      must_respond_with :not_found
    end
  end


end
