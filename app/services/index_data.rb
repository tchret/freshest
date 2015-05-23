require 'rest-client'

class IndexData < KimonoService
  attr_reader :response

  def initialize
    @response = JSON.parse(RestClient.get 'https://www.kimonolabs.com/api/8b6fnvc4?apikey=zj0UIbRDN9o2vsuGGQpVztNcFI9Udzch')
  end

  def generate
    last_posts(@response["results"]["collection1"])
  end

end