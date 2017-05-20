class AuthenticationController < ApplicationController
  def create
    session_creator = UserSession.for(request.format).new(
      params, session, headers
    )
    if session_creator.successful?
      redirect_to team_dashboard_path
    else
      render :new
    end
  end
end

class WebUserSession
  def initialize(params, session, headers)

  end

  def successful?; true; end
end

class UserSession
  class << self
    def for(format)
      authenticators[ format.to_s ]
    end

    def authenticators
      {
        "text/html" => WebUserSession,
      }
    end
  end

  def successful?
    true
  end
end
