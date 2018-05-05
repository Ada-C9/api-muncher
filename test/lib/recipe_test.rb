require 'test_helper'

describe Recipe do
  it "Cannot be initialized with less than 2 parameters" do
    proc {
      Channel.new
    }.must_raise ArgumentError

    proc {
      Channel.new "Name"
    }.must_raise ArgumentError
  end

  it "Must initialize name & id properly" do
    channel = Channel.new("Name", "ID")
    channel.name.must_equal "Name"
    channel.id.must_equal "ID"
  end
end
