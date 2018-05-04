require 'test_helper'
require 'pry'

describe EdamamApiWrapper do
  it 'can create an instance of itself' do
    a = EdamamApiWrapper.new
    a.wont_be_nil
  end

  it 'application can access the custom library' do
    EdamamApiWrapper::BASE_URL.wont_be_nil
  end

  it "can send a valid search request to the Edamam API" do
    VCR.use_cassette("recipes") do
      response = EdamamApiWrapper.list_recipes('apple')

      response.must_be_kind_of Array
      response.first.must_be_kind_of Recipe

    end
  end
  #   it "can't send message to  channel" do
  # VCR.use_cassette("channels") do
  #   response = SlackApiWrapper.send_msg("this-channel-does-not-exist", "test message")
  #   response["ok"].must_equal false
  #   response["error"].wont_be_nil
  # end



  it 'cannot be initialized with less than 1 parameter' do
    proc {EdamamApiWrapper.list_recipes}.must_raise ArgumentError
  end
end





#
#
