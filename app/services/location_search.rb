class LocationSearch
  def initialize(location)
    @location = location
    @coordinates = get_google_geo_response
  end

  def get_giphy
    result = parse(get_giphy_response)
  end

  def get_results
    parse(get_dark_sky_response)
  end

  def get_photos
    parse(get_flikr_response)
  end

  private
  def connection(url)
    connect = Faraday.new(:url => "#{url}") do |f|
      f.request :url_encoded
      f.adapter Faraday.default_adapter
    end
  end

  def get_google_geo_response
    response = connection('https://maps.googleapis.com/maps/api/geocode/').get 'json', {:address => "#{@location}", :key => "#{ENV['google_api_key']}"}
    parse(response)["results"][0]["geometry"]["location"]
  end

  def get_dark_sky_response
    response = connection("https://api.darksky.net/forecast/#{ENV['dark_sky_api_key']}/#{@coordinates["lat"]},#{@coordinates["lng"]}").get
  end

  def get_flikr_response
    response = connection("https://api.flickr.com/services/rest/").get '', keys
  end

  def get_giphy_response
    response = connection("https://api.giphy.com/v1/gifs/search").get '', giphy_keys
  end

  def parse(result)
    JSON.parse(result.body)
  end

  def giphy_keys
    {
      :api_key  => ENV['giphy_api_key'],
      :q        => "sunny"
    }
  end

  def keys
    {
      :method         => 'flickr.photos.search',
      :api_key        => ENV['flickr_api_key'],
      :lat            => "#{@coordinates["lat"]}",
      :lon            => "#{@coordinates["lng"]}",
      :safe_search    => "1",
      :content_type   => "1",
      :format         => "json",
      :nojsoncallback => "1",
      :page           => "1",
      :per_page       => "20",
      :extras         => "url_o"
    }
  end
end