require "test_helper"

describe User do
  describe 'build_from_google' do
    before do
      @user_hash = {
        'uid' => '11111111',
        'provider' => 'google',
        'info' => {
          'email' => 'test@gmail.com',
          'name' => 'test user'
        }
      }
    end

    it 'creates a new user if all required fields are present' do
      result = User.build_from_google(@user_hash)
      result.name.must_equal @user_hash['info']['name']
      result.uid.must_equal @user_hash['uid']
      result.provider.must_equal @user_hash['provider']
      result.email.must_equal @user_hash['info']['email']
    end

    it 'returns the user if the user already exists' do
      user = users(:one)

      result = User.build_from_google(user)
      result.must_equal user
    end

    it 'returns nil if insufficent data is provided' do
      @user_hash['info']['email'] = nil
      result = User.build_from_google(@user_hash)
      result.must_be_nil
    end
  end

  describe 'validations' do
    before do
      @user = User.new(name: 'test', email: 'test@email.com', uid: '1234', provider: 'google')
    end

    it 'requires an email' do
      @user.email = nil
      @user.wont_be :valid?
    end

    it 'can be created with all required data' do
      @user.must_be :valid?
    end

  end
end
