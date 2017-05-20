module UserSession
  def self.for(format)
    authenticators[ format.to_s ]
  end

  def self.authenticators
    {
      "text/html" => WebUserSession,
    }
  end
end
