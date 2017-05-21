module UserSession
  class NullUserSession < Base
    def successful?; false; end
  end
end
