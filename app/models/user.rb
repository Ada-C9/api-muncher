require 'pry'
class User < ApplicationRecord
  validates :username, presence: true, uniqueness: true
  def self.build_from_google(auth_hash)

    user_data = {
      uid: auth_hash[:uid],
      name: auth_hash["info"]["name"],
      username: build_username(auth_hash["info"]["email"]),
      email: auth_hash["info"]["email"],
      provider: auth_hash[:provider]
    }
    user = self.new(user_data)
    if user.save
      return user
    end
  end


  private
  def self.build_username(email)
    return email.split('@')[0]
  end


end
