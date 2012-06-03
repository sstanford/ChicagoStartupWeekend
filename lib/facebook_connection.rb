module FacebookConnection
  def self.client
    @fb_auth = FbGraph::Auth.new(FACEBOOK_SETTINGS[:app_id], FACEBOOK_SETTINGS[:app_secret])
    client = @fb_auth.client
    client.redirect_uri = "http://localhost:3000/end_login"
  end
end
