require 'test_helper'

describe EdamamApiWrapper do


  it "" do
    VCR.use_cassette("channels") do
      response = SlackApiWrapper.send_message("CAGCPB64A", "test message")
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
