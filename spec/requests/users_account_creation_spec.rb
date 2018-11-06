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
      # expect(response.status).to eq(201)
      # expect(response.body).to eq('{
      #                               "api_key": "jgn983hy48thw9begh98h4539h4"
      #                               }')
      expect(User.find_by_email("whatever@example.com").id).to_not eq(nil)
      end
    end
    it 'does not post with incorrect password' do
      expect(User.find_by_email("something@example.com")).to eq(nil)

      VCR.use_cassette('user_post_example_2') do
      post '/api/v1/users', params: {
                              "email": "something@example.com",
                              "password": "notapassword",
                              "password_confirmation": "password"
                            }
      
      expect(response.status).to eq(400)
      expect(response.message).to eq("Could not create user")
      expect(User.find_by_email("something@example.com").id).to eq(nil)
      end
    end
  end
end