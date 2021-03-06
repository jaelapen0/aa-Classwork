require 'bcrypt'

class User < ApplicationRecord
    validates :email, presence: true, uniqueness: true
    validates :password, length: {minimum: 6}, allow_nil: true
    validates :password_digest, presence: true
    validates :session_token, presence: true, uniqueness: true

    after_initialize :ensure_session_token

    attr_reader :password 

    def password=(password)
        @password = password
        self.password_digest = BCrypt::Password.create(password)
    end

    def is_password?(password)
        BCrypt::Password.new(password).is_password?(password)
    end

    def self.find_by_credentials(email, password)
        user = User.find_by(email: email)
        return nil unless !user.nil? && user.is_password?(password)
        user
    end

    def reset_session_token 
        self.session_token = self.class.generate_session_token
    end


    private
    def self.generate_session_token 
        SecureRandom::urlsafe_base64(16)
    end

    def ensure_session_token 
        self.session_token ||= User.generate_session_token
    end
end