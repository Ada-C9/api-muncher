require 'httparty'
require 'pry'


class SlackApiWrapper
  class SlackError < StandardError; end

  def self.list_channels
    token = ENV["SLACK_API_TOKEN"]
    url = "https://slack.com/api/channels.list?token=#{token}"

    response = HTTParty.get(url)

    raise_on_error(response)

    return response["channels"].map do |raw_channel|
      Channel.from_api(raw_channel)
    end
  end

  def self.send_message(channel_name, message)
    token = ENV["SLACK_API_TOKEN"]
    url_root = "https://slack.com/api/chat.postMessage"
    # Construct the full URL from the endpoint and the query params
    full_url = URI.encode("#{url_root}?channel=#{channel_name}&text=#{message}&token=#{token}&username=This is not Luxi&icon_emoji=:sheepy:")

    response = HTTParty.post(full_url)

    raise_on_error(response)

  end

  private
  def self.raise_on_error(response)
    unless response["ok"]
      raise SlackError.new(response["error"])
    end
  end
end
