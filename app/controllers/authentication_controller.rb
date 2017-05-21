class AuthenticationController < ApplicationController
  def create
    session_creator = UserSession.for(request.format).new(
      params: params, session: session, headers: request.headers
    )
    respond_to do |f|
      if session_creator.successful?
        f.html { redirect_to team_dashboard_path }
        f.json { render(
            json: {
              user: { id: session_creator.user.id, email: session_creator.user.email },
              authToken: session_creator.authToken,
            }
          )
        }
      else
        f.html { render :new }
      end
    end
  end
end

