class AuthTokenGenerator
  def initialize(user, agent, platform, token_model=AuthenticationToken)
    @user = user
    @agent = agent
    @platform = platform
    @token_model = token_model
  end

  def generate
    token_model.create!(
      user: user,
      expires_at: 2.weeks.from_now,
      agent: agent,
      platform: platform
    ).token
  end

  private

  attr_reader :user, :agent, :platform, :token_model
end
