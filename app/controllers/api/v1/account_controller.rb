class Api::V1::AccountController < ApplicationController
  def create
    if !User.find_by_email(params[:email]) && (params[:password] == params[:password_confirmation])
      user = User.create!(email: params[:email], password: params[:password])
      render status: 201, body: { "api_key": "#{User.find_by_email(params[:email]).api_key}"}
    end
  end
end