require 'rails_helper'

describe 'api/v1/sessions' do
  it 'allows user to login' do
    id = User.create(email: "whatever@example.com", password: "password").id
    api_key = User.find_by_id(id).api_key
    expect(User.find_by_email("whatever@example.com").id).to eq(id)

    VCR.use_cassette('user_login_example') do
      post '/api/v1/sessions', params: {
                                "email": "whatever@example.com",
                                "password": "password",
                                "password_confirmation": "password"
                               }

     expect(response).to be_successful
     expect(response.status).to eq(200)
     expect(JSON.parse(response.body)).to eq({"api_key" => "#{api_key}"})
    end
  end
end