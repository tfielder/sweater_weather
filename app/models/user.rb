class User < ApplicationRecord

  has_secure_password

  def initialize
    create_api_key
  end

  private
  def create_api_key
    self.api_key = SecureRandom.urlsafe_base64
  end
end