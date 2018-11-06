class Api::V1::AccountController < ApplicationController
  def create
    #if !User.find_by_email(params[:email]) && (params[:password] == params[:password_confirmation])
      #render status: 201, body: { "api_key": "#{User.find_by_email(params[:email])}"}


  end

  # def lookup
  #   #if user (password == password_confirmation) && User.find_by_email(params[:email]).password == password
  #     #render status: 201, body: { "api_key": "#{User.find_by_email(params[:email])}"}
  #   #else
  #     #flash[:notice] = "Credentials could not be verified. Please try again."
  #     #redirect to login page
  #   #end
  # end
end