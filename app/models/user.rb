class User < ApplicationRecord

  has_secure_password

  before_save :create_api_key

  private
  def create_api_key
    self.api_key = SecureRandom.urlsafe_base64
  end
end