require 'test_helper'

describe EdamamApiWrapper do

  it "can send " do

    VCR.use_cassette("channels") do
      # message = "Hooray!"
      # response = EdamamApiWrapper.send_message("CAGCPB64A", message)
      response["ok"].must_equal true
      response["message"]["text"].must_equal message
    end

  end

end
