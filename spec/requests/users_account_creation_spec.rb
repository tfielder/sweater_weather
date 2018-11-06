require 'rails_helper'

describe 'api/v1/users' do
  describe 'allows a user to post' do
    it 'posts to create a new user' do
      expect(User.find_by_email("whatever@example.com")).to eq(nil)

      VCR.use_cassette('user_post_example') do
      post '/api/v1/users', params: {
                              "email": "whatever@example.com",
                              "password": "password",
                              "password_confirmation": "password"
                            }

      expect(response).to be_successful
      expect(response.status).to eq(201)
      expect(User.find_by_email("whatever@example.com").id).to_not eq(nil)
      end
    end
  end
end