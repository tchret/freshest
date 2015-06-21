require 'rest_client'

class SourceData < KimonoService
  attr_reader :response

  def initialize(twitter_id)
    # RestClient.post "https://www.kimonolabs.com/kimonoapis/7fswwcrw/startcrawl", apikey: "zj0UIbRDN9o2vsuGGQpVztNcFI9Udzch"
    # @response = RestClient.get "https://www.kimonolabs.com/ondemand/7fswwcrw?&kimpath1=#{twitter_id}", apikey: "zj0UIbRDN9o2vsuGGQpVztNcFI9Udzch"
  end

  def generate
    # fresh_tweets(@response["results"]["collection2"])
  end
end