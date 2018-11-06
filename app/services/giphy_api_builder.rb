class GiphyApiBuilder
  def initialize(dark_sky, giphy)
    @dark_sky = dark_sky
    @giphy = giphy
    get_weather
    binding.pry
  end

  def return_response
    # {  data: {
    #    images: get_weather
    # }
    #     copyright: "2018"}
  end

  def get_weather
    outlook = weekly_outlook.map do |hash|
      new_hash = {}
      new_hash["time"] = hash["time"]
      new_hash["summary"] = hash["summary"]
      new_hash["url"] = 
      new_hash
    end
    binding.pry
  end

  def weekly_outlook
    @outlook = @dark_sky["daily"]["data"]
  end
end