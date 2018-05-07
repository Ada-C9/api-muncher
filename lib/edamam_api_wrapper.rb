require 'httparty'

class EdamamApiWrapper
  # Your code here!
  def self.recipe_list(query)
    q = query
    to = 100
    #(10 * page) + 1
    from = 10
    #to - 10

    key = ENV["EDAMAM_KEY"]
    id = ENV["APPLICATION_ID"]
    url  = URI.encode"https://api.edamam.com/search?app_id=#{id}&app_key=#{key}&q=#{q}&from=#{from}&to=#{to}"
    response = HTTParty.get(url)


    #unless response["ok"]
    #raise StandarError.new(response["error"])
    #en
    #return response["hits"]
    #total_results = response["hits"].maps.count

    return response["hits"].map do |raw_recipe|

      Recipe.from_api(raw_recipe["recipe"])
      #created a from_api to channel in lib to be able to dry up the code a little bit and we isolate the [:name] in channels over there.
    end
  end

  def self.one_recipe(uri)
    uri = uri
    id = ENV["APPLICATION_ID"]
    key = ENV["EDAMAM_KEY"]

    url_root = "http://www.edamam.com/ontologies/edamam.owl#recipe_#{uri}"
    url  = URI.encode"https://api.edamam.com/search?app_id=#{id}&app_key=#{key}&r=#{url_root}"
    response = HTTParty.get(url)
    #http://www.edamam.com/ontologies/edamam.owl#recipe_3f1569240d53523d54aec78a409379fa   URI

    return  Recipe.from_api(response[0])
    #created a from_api to channel in lib to be able to dry up the code a little bit and we isolate the [:name] in channels over there.

  end
end


  # def self.send_message(channel_name, message)
  #   token = ENV["SLACK_TOKEN"]
  #   url_root = "https://slack.com/api/chat.postMessage"
  #   full_url = URI.encode("#{url_root}?channel=#{channel_name}&text=#{message}&token=#{token}")
  #   #the name of the list is url_root and is always that with a ? after, then are all the key value pairs with an & in between. the order does not matter. To test it we put a puts
  #
  #   puts "About to send request to #{full_url}"
  #
  #   response = HTTParty.post(full_url)
  #
  #   unless response["ok"]
  #     raise StandarError.new(response["error"])
  #
  #   end
  # end
