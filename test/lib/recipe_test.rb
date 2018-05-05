require 'test_helper'

describe 'Recipe' do
  describe 'initialize' do
    it "cannot be initialized with less than the required parameters" do

    end

    it "must initialize all parameters properly" do

    end
  end

  describe 'from_api' do
    before do
      @recipe_data = {
        "label" => "teriyaki chicken"
        "image"=>"image"
        "calories" => "calories"
        "url" => "url"
        "uri" => "uri"
        "ingredients" => "ingredients"
        "health" => "health"
        "source" => "source"
      }
    end
    it "gets the correct info and puts in an instance of Recipe" do

    end

    it "raises an error when bad data is passed back" do

    end
  end


end
