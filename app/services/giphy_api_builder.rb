class GiphyApiBuilder
  def initialize(dark_sky, giphy)
    @dark_sky = dark_sky
    @giphy = giphy
  end

  def return_response
    {
      data: {
       images: get_weather
     },
        copyright: "2018"
    }
  end

  def get_weather
    outlook = weekly_outlook.map do |hash|
      new_hash = {}
      new_hash["time"] = hash["time"]
      new_hash["summary"] = hash["summary"]
      giphy_result = get_giphy(hash["summary"].gsub(/ /, '+'))
      new_hash["url"] = giphy_result["data"][0]["url"]
      new_hash
    end
  end

  def weekly_outlook
    @outlook = @dark_sky["daily"]["data"]
  end

  def get_giphy(term)
    result = parse(get_giphy_response(term))
  end

  private
  def connection(url)
    connect = Faraday.new(:url => "#{url}") do |f|
      f.request :url_encoded
      f.adapter Faraday.default_adapter
    end
  end

  def get_giphy_response(term)
    response = connection("https://api.giphy.com/v1/gifs/search").get '', giphy_keys(term)
  end

  def parse(result)
    JSON.parse(result.body)
  end

  def giphy_keys(term)
    {
      :api_key  => ENV['giphy_api_key'],
      :q        => "#{term}"
    }
  end
end