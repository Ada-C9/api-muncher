require 'test_helper'

describe EdamamApiWrapper do
  # it "Can send valid message to real channel" do
  #   VCR.use_cassette("channels") do
  #     message = "test message"
  #     response = SlackApiWrapper.send_msg("<CHANNELID>", message)
  #     response["ok"].must_equal true
  #     response["message"]["text"].must_equal message
  #   end
  # end
  # it "Can't send message to fake channel" do
  #   VCR.use_cassette("channels") do
  #     response = SlackApiWrapper.send_msg("this-channel-does-not-exist", "test message")
  #     response["ok"].must_equal false
  #     response["error"].wont_be_nil
  #   end
  # end
end
