module UserSession
  def self.for(format)
    authenticators[ format.to_s ] || NullUserSession
  end

  def self.authenticators
    {
      "text/html"         => WebUserSession,
      "application/json"  => APIUserSession,
    }
  end
end
