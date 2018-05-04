require 'test_helper'

describe ApiMuncherWrapper do

  describe "search_recipes" do
    it "lists a set of recipes if given correct arguments" do

      VCR.use_cassette("recipes") do

        data = ApiMuncherWrapper.search_recipes("tofu")
        data.count.must_equal 10
      end

    end
  end
end
