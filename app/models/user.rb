# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  name            :text             not null
#  password_digest :text             not null
#  session_token   :text             not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class User < ApplicationRecord
    has_secure_password
    validates :password, length: {minimum: 6, allow_nil: true}
    validates :name, presence: true, uniqueness: true
    after_initialize :ensure_session_token

    has_many :subs,
        foreign_key: :moderator_id,
        dependent: :destroy

    def self.find_by_credentials(name,password)
        user = User.find_by(name: name)
        if user.nil?
            return nil
        end
        user.authenticate(password) ? user : nil
    end

    def generate_session_token
        self.session_token = SecureRandom::urlsafe_base64(16)
    end

    def reset_session_token!
        self.session_token = self.generate_session_token
        self.save!
        self.session_token
    end

    private
    def ensure_session_token
        self.session_token ||= self.generate_session_token
    end

end
