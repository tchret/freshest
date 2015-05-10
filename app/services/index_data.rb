require 'rest-client'

class IndexData < KimonoService
  attr_reader :response

  def initialize
    RestClient.post "https://www.kimonolabs.com/kimonoapis/8b6fnvc4/startcrawl", apikey: "zj0UIbRDN9o2vsuGGQpVztNcFI9Udzch"
    @response = JSON.parse(RestClient.get 'https://www.kimonolabs.com/api/8b6fnvc4?apikey=zj0UIbRDN9o2vsuGGQpVztNcFI9Udzch')
  end

  def generate
    fresh_tweets(@response["results"]["collection1"])
  end

end