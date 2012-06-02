class HomeController < ActionController::Base
  def index
    render :layout => "application"
  end

  def start_login
    fb_auth = FbGraph::Auth.new(369584459769856, '7602e71b92db2d82a9e219b293f92157')
    client = fb_auth.client
    client.redirect_uri = "http://localhost:3000/end_login"

    # redirect user to facebook
    redirect_to client.authorization_uri(
      :scope => [:email, :publish_stream, :offline_access]
    )

  end

  def end_login
    fb_auth = FbGraph::Auth.new(369584459769856, '7602e71b92db2d82a9e219b293f92157a')
    
    client = fb_auth.client
    client.redirect_uri = "http://localhost:3000/end_login"

    client.authorization_code = params[:code]
    ap  params[:code]
    access_token = client.access_token!  # => Rack::OAuth2::AccessToken
    ap FbGraph::User.me(access_token).fetch
  end
end
