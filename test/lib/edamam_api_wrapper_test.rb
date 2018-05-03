require 'test_helper'
require 'pry'
describe EdamamApiWrapper do

  it "Can return array of recipes based on query" do
    VCR.use_cassette("recipes") do
      query = "chicken"
      response = EdamamApiWrapper.list_recipes(query)
      response["ok"].must_equal true
    end
  end
  #
  # it "Can send valid message to real channel" do
  #   VCR.use_cassette("channels") do
  #     message = "test message"
  #     response = SlackApiWrapper.send_message("CAGCPB64A", message)
  #     response["ok"].must_equal true
  #     response["message"]["text"].must_equal message
  #   end
  # end
  #
  # it "Can't send message to fake channel" do
  #   VCR.use_cassette("channels") do
  #     response = SlackApiWrapper.send_message("this-channel-does-not-exist", "test message")
  #     response["ok"].must_equal false
  #     response["error"].wont_be_nil
  #   end
  # end

end
