require 'rails_helper'

describe 'api/v1/forecast' do
  it 'returns a successful response' do
    get '/api/v1/forecast'

    forecast = JSON.parse(response.body)

    expect(response.body).to be_successful
  end
end