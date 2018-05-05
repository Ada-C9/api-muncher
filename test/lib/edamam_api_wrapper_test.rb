require 'test_helper'

describe EdamamApiWrapper do
  describe'list_recipes' do

    it"returns list of 10 recipes if given a search term" do

      VCR.use_cassette("recipes") do

        data = EdamamApiWrapper.list_recipes("fish")
        data.count.must_equal 10
        data.must_be_instance_of Array

      end
    end

    it"returns empty array if given a empty string assearch term" do

      VCR.use_cassette("recipes") do

        data = EdamamApiWrapper.list_recipes("")
        data.count.must_equal 0
        data.must_equal []

      end
    end

  end

  
end
