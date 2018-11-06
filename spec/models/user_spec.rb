require 'rails_helper'

describe User, type: :model do
   it 'exits' do
     user_1 = User.create!(email: "yodel@yahoo.com", password: "password")

     expect(user_1).to be_a(User)
     expect(user_1.email).to eq("yodel@yahoo.com")
     expect(user_1.password).to eq("password")
   end
end