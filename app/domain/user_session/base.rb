module UserSession
  class Base
    def initialize(params: {}, session: {}, headers: {})
      @params, @session, @header = params, session, headers
    end

    private

    attr_reader :params, :session, :headers
  end
  
end
