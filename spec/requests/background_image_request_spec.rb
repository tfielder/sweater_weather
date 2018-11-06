require 'rails_helper'

describe 'api/v1/backgrounds' do
  it 'returns a successful response' do
    VCR.use_cassette("background_one") do
      get '/api/v1/backgrounds?location=denver,co'
    end

    expect(response).to be_successful
  end
end