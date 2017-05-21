class AuthenticationToken < ApplicationRecord
  has_secure_token

  belongs_to :user

  # ATTRS
  # - user_id
  # - expires_at
  # - token
  # - agent
  # - platform
end
