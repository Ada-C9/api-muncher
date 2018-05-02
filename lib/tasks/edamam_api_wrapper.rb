require 'httparty'
BASE_URL = "https://api.edamam.com/search?q="
KEY = ENV["APP_KEY"]
APP = ENV["APP_ID"]

class EdamamApiWrapper

  def self.search(query)
    url = BASE_URL + "#{query}" "app_id=#{APP}" + "app_id=#{APP}"
    data = HTTParty.get(url)
    unless data["ok"]
      raise StandardError.new(response["error"])
    end

    if data["channels"]
      return data["channels"].map do |raw_recipe| Recipe.from_api(raw_recipe)
      end
    else
      return []
    end
  end

  def self.send_msg(channel, msg)
    puts "Sending message to channel #{channel}: #{msg}"

    url = BASE_URL + "chat.postMessage?" + "token=#{TOKEN}"

    random_bot = [
      {
        name: "Awkward-Turtle",
        icon: ":turtle:"
      },
      {
        name: "Botly McBot",
        icon: ":space_invader:"},
        {
          name: "Dance Party Bot",
          icon: ":totoro_hula:"}, {name: "Pengy", icon: ":dancing_penguin:"}, {name: "No, just no", icon: ":rocket:"}, {name: "You Know", icon: ":sheepy:"}]

          bot = random_bot.sample

          response = HTTParty.post(url,
            body:  {
              "text" => "#{msg}",
              "channel" => "#{channel}",
              "username" => bot[:name],
              "icon_emoji" => bot[:icon],
              "as_user" => "false"
            },
            :headers => { 'Content-Type' => 'application/x-www-form-urlencoded' })
            return response.success?
          end



        end
