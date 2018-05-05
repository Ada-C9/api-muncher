require 'httparty'

class EdamamApiWrapper
  def self.search_results(query)
    app_id = ENV["EDAMAM_APP_ID"]
    app_key = ENV["EDAMAM_APP_KEY"]
    url = "https://api.edamam.com/search?q=#{query}&app_id=#{app_id}&app_key=#{app_key}&from=0&to=120"

    response = HTTParty.get(url).parsed_response

    unless response["count"] > 0
      raise StandardError.new
    end

    return response["hits"].map do |raw_recipe|
      Recipe.from_query_api(raw_recipe)
    end
  end

  def self.recipe_details(id)
    app_id = ENV["EDAMAM_APP_ID"]
    app_key = ENV["EDAMAM_APP_KEY"]
    uri = "http%3A%2F%2Fwww.edamam.com%2Fontologies%2Fedamam.owl%23recipe_" + id.to_s
    url = "https://api.edamam.com/search?r=#{uri}&app_id=#{app_id}&app_key=#{app_key}"

    response = HTTParty.get(url).parsed_response

    unless response.count > 0
      raise StandardError.new
    end

    return  Recipe.from_recipe_api(response)
  end
end
