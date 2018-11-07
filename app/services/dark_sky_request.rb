class DarkSkyRequest
  def initialize(location)
    @coordinates = GoogleGeoRequest.new(location).coordinates
  end

  def get_dark_sky
    parse(get_dark_sky_response)
  end

  private
  def connection(url)
    connect = Faraday.new(:url => "#{url}") do |f|
      f.request :url_encoded
      f.adapter Faraday.default_adapter
    end
  end

  def get_dark_sky_response
    response = connection("https://api.darksky.net/forecast/#{ENV['dark_sky_api_key']}/#{@coordinates["lat"]},#{@coordinates["lng"]}").get
  end

  def parse(result)
    JSON.parse(result.body)
  end
end