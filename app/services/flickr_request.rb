class FlickrRequest
  def initialize(location)
    @coordinates = GoogleGeoRequest.new(location).coordinates
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

  def get_flikr_response
    response = connection("https://api.flickr.com/services/rest/").get '', keys
  end

  def parse(result)
    JSON.parse(result.body)
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