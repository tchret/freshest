class Slack
  def initialize
    @username ="CRISP - #{Rails.env}"
    @channel = Rails.env.production? ? "#freshest" : "#freshest-test"
    @incoming_webhook_url = "https://hooks.slack.com/services/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"
  end

  def post(options = {})
    options[:icon_url] = "http://www.lewagon.org/favicon.png" unless options[:icon_emoji]
    options[:username] ||= @username
    options[:channel] ||= @channel
    RestClient.post @incoming_webhook_url, options.to_json, content_type: :json, accept: :json
  end
end