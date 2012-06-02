class HomeController < ActionController::Base
  rescue_from Rack::OAuth2::Client::Error, :with => :oauth2_error

  def index
    render :layout => "application"
  end

  def start_login
    redirect_to facebook_client.authorization_uri(
      :scope => [:email, :publish_stream, :offline_access]
    )
  end

  def end_login
    facebook_client.authorization_code = params[:code]
    access_token = facebook_client.access_token! :client_auth_body  # => Rack::OAuth2::AccessToken
    ap FbGraph::User.me(access_token).fetch
    
  end

  private

  def facebook_client
    @fb_auth ||= FbGraph::Auth.new(369584459769856, '7602e71b92db2d82a9e219b293f92157')
    client = @fb_auth.client
    client.redirect_uri = "http://localhost:3000/end_login"
    client
  end

  def oauth2_error(e)
    ap flash[:error] = {
      :title => e.response[:error][:type],
      :message => e.response[:error][:message]
    }
  end

end
