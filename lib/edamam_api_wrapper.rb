require 'httparty'

class EdamamApiWrapper

  URL = " https://api.edamam.com/search"
  APP_ID = ENV["APPLICATION_ID"]
  APP_KEY = ENV["APPLICATION_KEY"]

  def self.search_result(query)

    response = HTTParty.get("#{URL}q?#{query}&app_id=#{APP_ID}&app_key=#{APP_KEY}")

    recipe_list = []
    if response["channels"]
      response["channels"].each do |channel|
        channel_list << Channel.new(channel["name"], channel["id"])
      end
    end
    return channel_list
  end


  def self.send_message(channel, message)

    message_url = "#{URL}chat.postMessage"

    response = HTTParty.post(message_url,
      body: {
        "token" => TOKEN,
        "channel" => channel,
        "text" => message,
         # "username" => "Victoria",
         "icon_emoji" => ":dancing_corgi:",
         "icon_url" => "https://photos.app.goo.gl/UBU20WsDvyYhGYb83",
         "as_user" => "false"
      },
      :headers => { 'Content-Type' => 'application/x-www-form-urlencoded' }
      )
      return response
  end

end
