module UserSession
  class Base
    def initialize(params: {}, session: {}, headers: {})
      @params, @session, @headers = params, session, headers
    end

    def successful?
      raise NotImplementedError
    end

    private

    attr_reader :params, :session, :headers
  end
  
end
