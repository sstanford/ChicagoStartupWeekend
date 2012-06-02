class FacebookConnection
  def self.client
    @fb_auth = FbGraph::Auth.new(369584459769856, '7602e71b92db2d82a9e219b293f92157')
    client = @fb_auth.client
    client.redirect_uri = "http://localhost:3000/end_login"
  end
end
