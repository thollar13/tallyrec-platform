class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :authentication_tokens

  def self.find_by_auth_token(token)
    joins(:authentication_tokens).
      where(authentication_tokens: { token: token }).
      limit(1)
  end
end
