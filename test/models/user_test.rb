require "test_helper"

describe User do
  it "can be created with valid data" do

    user_data = {
      provider: "google_oauth2",
      uid: 11111111,
      email: "kat.eastman@gmail.com",
      username: "kat.eastman",
      name: "Kat"
    }


    user = User.create(user_data)

    result = user.valid?

    result.must_equal true
  end

  it "Can be built from google auth_hash" do
    user_data = {
      provider: "google_oauth2",
      uid: 11111111,
      email: "kat.eastman@gmail.com",
      username: "kat.eastman",
      name: "Kat"
    }
    orig_user_count = User.count
    user = User.new(user_data)

    user.must_be :valid?

    auth_hash = mock_auth_hash(user)
    puts auth_hash

    user = User.build_from_google(auth_hash)

    result = User.count
    result.must_equal orig_user_count + 1
  end
end
