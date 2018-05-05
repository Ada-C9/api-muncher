require 'test_helper'

describe 'Recipe' do
  describe 'initialize' do
    it "is created with label, image and source" do
      label = 'Frozen Yogurt'
      image = 'url here'
      source = 'another url'

      recipe = Recipe.new(label, image, source)

      recipe.label.must_equal label
      recipe.image.must_equal image
      recipe.source.must_equal source

    end

    it 'cannot create without chosen data' do
      proc{Recipe.new(image, source).must_raise ArgumentError}
      proc{Recipe.new(label, image).must_raise ArgumentError}
      proc{Recipe.new(label, source).must_raise ArgumentError}
      proc{Recipe.new().must_raise ArgumentError}

    end
  end

  describe 'from_api' do
    before do
      @mock_data = {
        'label' => 'FroYo',
        'image' => 'the triforce',
        'source' => 'I.. have.. The Power!'
      }
    end

    it "gets chosen data for instance of recipe" do
      recipe = Recipe.from_api(@mock_data)
      recipe.must_be_kind_of Recipe
      recipe.label.must_equal @mock_data['label']
      recipe.image.must_equal @mock_data['image']
      recipe.source.must_equal @mock_data['source']
    end

    it "raises an error if missing data" do
      @mock_data['label'] = nil

      proc{Recipe.from_api(@mock_data)}.must_raise ArgumentError

    end
  end
end
