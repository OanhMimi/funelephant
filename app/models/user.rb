# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  email           :string           not null
#  firstName       :string           not null
#  lastName        :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class User < ApplicationRecord
    has_secure_password

    validates :firstName, :lastName, presence: true
    validates :email, uniqueness: true, length: { in: 8..50 }, format: { with: URI::MailTo::EMAIL_REGEXP }
    validates :session_token, presence: true, uniqueness: true
    validates :password, length: { in: 6..35 }, allow_nil: true


    before_validation :ensure_session_token

    def self.find_by_credentials(email, password)
        user = User.find_by(email: email)
        user&.authenticate(password)
    end

    def reset_session_token!
        self.session_token = generate_unique_session_token
        self.save!
        self.sesson_token
    end

    private

    def generate_unique_session_token
        token = SecureRandom::urlsafe_base64 
        if User.exists?(session_token: token)
            token = SecureRandom::urlsafe_base64 
        end
        token
    end

    def ensure_session_token
        self.session_token ||= generate_unique_session_token
    end

end