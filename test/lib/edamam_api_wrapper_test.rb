require 'test_helper'

describe EdamamApiWrapper do

  it "displays results for a valid ingredient search" do
    VCR.use_cassette("recipe") do
      response = edamamApiWrapper.list_recipes("chicken")
      response["ok"].must_equal true
      response["message"]["text"].must_equal "test message"
    end
  end

  it "Can't send message to fake channel" do
    VCR.use_cassette("channels") do
      response = SlackApiWrapper.send_message("this-channel-does-not-exist", "test message")
      response["ok"].must_equal false
      response["error"].wont_be_nil
    end
  end
end
