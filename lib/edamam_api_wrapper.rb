require 'httparty'
require 'pry'
BASE_URL = "https://api.edamam.com/search?"
KEY = ENV["APP_KEY"]
APP = ENV["APP_ID"]

class EdamamApiWrapper

  def self.search(query)
    if query.include?("#recipe_")
      query = query.gsub('#', '%23')
      url = BASE_URL + "r=http%3A%2F%2Fwww.edamam.com%2Fontologies%2Fedamam.owl#{query}" + "&app_id=#{APP}" + "&app_key=#{KEY}"
    else
      url = BASE_URL + "q=#{query}" "&app_id=#{APP}" + "&app_key=#{KEY}" + "&from=0&to=1000"
      url = URI.encode(url)

    end
    data = HTTParty.get(url)
    if data["uri"]
      binding.pry
      return Recipe.from_api(data)
    else

      unless data["hits"]
        raise StandardError.new(data["error"])
      end

      if data["hits"]
        return data["hits"].map do |raw_recipe| Recipe.from_api(raw_recipe)
        end
      else
        return []
      end
    end
  end

  def self.recipe_query(recipe)


    encoded_url = URI.encode(url)
    data = HTTParty.get(encoded_url)
    unless data["hits"]
      raise StandardError.new(data["error"])
    end

    if data["hits"]
      return data["hits"].map do |raw_recipe| Recipe.from_api(raw_recipe)
      end
    else
      return []
    end
  end
end

# def self.send_msg(channel, msg)
#   puts "Sending message to channel #{channel}: #{msg}"
#
#   url = BASE_URL + "chat.postMessage?" + "token=#{TOKEN}"
#
#   random_bot = [
#     {
#       name: "Awkward-Turtle",
#       icon: ":turtle:"
#     },
#     {
#       name: "Botly McBot",
#       icon: ":space_invader:"},
#       {
#         name: "Dance Party Bot",
#         icon: ":totoro_hula:"}, {name: "Pengy", icon: ":dancing_penguin:"}, {name: "No, just no", icon: ":rocket:"}, {name: "You Know", icon: ":sheepy:"}]
#
#         bot = random_bot.sample
#
#         response = HTTParty.post(url,
#           body:  {
#             "text" => "#{msg}",
#             "channel" => "#{channel}",
#             "username" => bot[:name],
#             "icon_emoji" => bot[:icon],
#             "as_user" => "false"
#           },
#           :headers => { 'Content-Type' => 'application/x-www-form-urlencoded' })
#           return response.success?
#         end
#
#
#
#       end
