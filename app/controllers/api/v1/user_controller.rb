class Api::V1::UserController < ApplicationController
  def create
    if !User.find_by_email(params[:email]) && (params[:password] == params[:password_confirmation])
      user = User.create!(email: params[:email], password: params[:password])
      render json: { "api_key" => "#{User.find_by_email(params[:email]).api_key}" }, status: 201
    end
  end
end