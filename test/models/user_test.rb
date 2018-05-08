require "test_helper"
require 'pry'

describe User do
  let(:user) { User.new(username:"jay-z",email:"jayz@gmail.com", uid: 132123) }

  it "must be valid" do
    value(user).must_be :valid?
  end

  it "must describe a user w/o a username as not valid" do
    user[:username] = nil
    status = user.valid?
    status.must_equal false
  end
end
