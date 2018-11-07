class Api::V1::SessionController < ApplicationController
  def create
    if params[:password] && params[:email] && (params[:password] == params[:password_confirmation]) && User.find_by(email: params[:email]).try(:authenticate, params[:password])#(User.find_by_email(params[:email]).password == params[:password])
      render json: { "api_key" => "#{User.find_by_email(params[:email]).api_key}" }, status: 200
    end
  end
end