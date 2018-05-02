require 'httparty'
require 'vcr'
require 'webmock/minitest'

class MuncherWrapper
  URL = "https://api.edamam.com/search"
  KEY = ENV["APP_KEY"]
  ID = ENV["APP_ID"]

  #https://api.edamam.com/search?q=tofu&app_id=ac90edea&app_key=15377e03ea749d93448fa475dc31e069

  def self.get_recipes(search_phrase)
    return [] if search_phrase.blank?

    response = HTTParty.get("?#{URL}q=#{search_phrase}&app_id=#{ID}&app_key=#{KEY}")

    recipe_list = []

    if response["hits"]
      response["hits"].each do |recipe|
        recipe_list << Recipe.new(recipe["label"], recipe["uri"], recipe["image"], recipe["healthLabels"])
      end
    end

    return recipe_list

  end

#   def self.send_message(channel, message)
#     message_url = "#{URL}chat.postMessage"
#     response = HTTParty.post(message_url, body: {
#       "token" => TOKEN,
#       "channel"=> channel,
#       "text" => message,
#       "username" => "ShibbyBOT",
#       "icon_emoji" => ":bye_boo:",
#       "as_user" => "false"
#     },
#     :headers => {'Content-Type' => 'application/x-www-form-urlencoded'}
#   )
#   return response
# end

end
