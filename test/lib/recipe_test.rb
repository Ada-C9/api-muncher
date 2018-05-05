require "test_helper"

describe Recipe do
  describe "initialize" do
    it "can be created with all parameters needed" do
      label = label
      image = image
      health = health
      ingredients = ingredients
      url = url
      uri = uri

      recipe = Recipe.new(label, image, health, ingredients, url, uri)

      recipe.label.must_equal label
      recipe.uri.must_equal uri
    end


    it "cannot be created without a name or an id" do
      skip
      proc { Recipe.new()}.must_raise ArgumentError
      proc { Recipe.new(uri)}.must_raise ArgumentError
      proc { Recipe.new("",12345)}.must_raise ArgumentError
      proc { Recipe.new(nil, 12345)}.must_raise ArgumentError
    end

  end

  describe "from_api" do
    # skip
    # before do
    #   @fake_channel_data = {
    #     "name" => "test channel",
    #     "id" => 12345
    #   }


    it "pulls the relevant information into an instance of channel" do
      # channel = Channel.from_api(@fake_channel_data)
      #
      # channel.must_be_kind_of Channel
      # channel.name.must_equal @fake_channel_data["name"]
      # channel.id.must_equal @fake_channel_data["id"]
    end

    it "raises and exception without critical data" do
      # @fake_channel_data["name"] = nil
      # proc { Channel.from_api(@fake_channel_data)}.must_raise
    end


  end
end
