class GiphyApiBuilder
  def initialize(dark_sky)
    @dark_sky = dark_sky
  end

  def return_response
    {
      data: {
              images: array_builder
            },
      copyright: "2018"
    }
  end

  private


  def weekly_outlook
    @outlook = @dark_sky["daily"]["data"]
  end

  def array_builder
    outlook = weekly_outlook.map do |hash|
      new_hash = {}
      new_hash[:time] = hash["time"]
      new_hash[:summary] = hash["summary"]
      # giphy_result = get_giphy(hash["summary"].gsub(/ /, '+'))
      # giphy_result = GiphyRequest.new(hash["summary"]).get_giphy_response
      # giphy_result = GiphyRequest.new(hash["summary"]).get_url
      # new_hash[:url] = giphy_result["data"][0]["url"]
      new_hash[:url] = GiphyRequest.new(hash["summary"]).get_url
      new_hash
    end
  end
end