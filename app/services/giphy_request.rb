class GiphyRequest
  def initialize(term)
    @term = format_term(term)
  end

  def get_url
    get_giphy["data"][0]["url"]
  end

  private
  def format_term(term)
    term.gsub(/ /, '+')
  end

  def connection(url)
    connect = Faraday.new(:url => "#{url}") do |f|
      f.request :url_encoded
      f.adapter Faraday.default_adapter
    end
  end

  def get_giphy_response
    response = connection("https://api.giphy.com/v1/gifs/search").get '', giphy_keys
  end

  def giphy_keys
    {
      :api_key  => ENV['giphy_api_key'],
      :q        => "#{@term}"
    }
  end

  def parse(result)
    JSON.parse(result.body)
  end

  def get_giphy
    result = parse(get_giphy_response)
  end
end