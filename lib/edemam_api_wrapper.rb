class EdemamApiWrapper

  # class EdemamError < StandardError; end

  def self.list_recipes(flavor)
    app_id = ENV["EDEMAM_ID"]
    app_key = ENV["EDEMAM_KEY"]
    to = 119
    url_root = "https://api.edamam.com/search"

    full_url = URI.encode("#{url_root}?q=#{flavor}&app_id=#{app_id}&app_key=#{app_key}&to=#{to}")

    response = HTTParty.get(full_url).parsed_response

    raise ArgumentError.new("Could not find recipes") unless response["hits"]

    recipes = []
    response["hits"].each do |hit|
      recipes << Recipe.new(hit["recipe"])
    end
    return recipes
  end

  def self.find_recipe(uri)
    app_id = ENV["EDEMAM_ID"]
    app_key = ENV["EDEMAM_KEY"]
    url_root = URI.encode("https://api.edamam.com/search?r=http://www.edamam.com/ontologies/edamam.owl#recipe_")

    full_url = "#{url_root}#{uri}&app_id=#{app_id}&app_key=#{app_key}"
    response = HTTParty.get(full_url).parsed_response
    # binding.pry
    raise ArgumentError.new("Could not find recipe") unless response[0]

    return Recipe.new(response[0])
  end

  # private
  # def self.raise_on_error(response)
  #   binding.pry
  #   unless response["hits"] || response[0]["uri"]
  #     raise EdemamError.new("There is error")
  #   end
  # end
end
