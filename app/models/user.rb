class User < ApplicationRecord
  validates :email, presence: true

  def self.build_from_google(data_hash)
    user = User.find_by(uid: data_hash['uid'], provider: data_hash['provider'])
    if user.nil?
      new_user = User.new(
        provider: data_hash['provider'],
        uid: data_hash['uid'],
        name: data_hash['info']['name'],
        email: data_hash['info']['email']
      )

      return new_user.save ? new_user : nil
    end
    return user
  end
end
