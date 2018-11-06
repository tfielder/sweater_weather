require 'rails_helper'

describe 'API response from giphy' do
  describe '/api/v1/gifs/' do
    it 'returns a successful response' do
      VCR.use_cassette("giphy_request") do
        get '/api/v1/gifs/location=denver,co'

        expect(response).to be_successful

        # expect(response.body).to eq()
      end
    end
  end
end
