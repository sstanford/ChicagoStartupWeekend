class HomeController < ApplicationController
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
    fb_user = FbGraph::User.me( access_token.access_token).fetch
    user = User.where(facebook_id: fb_user.identifier).first

    unless user
      set_current_user( User.create!( pending: false,
                                 facebook_id: fb_user.identifier,
                                 first_name: fb_user.first_name,
                                 last_name: fb_user.last_name,
                                 email: fb_user.email,
                                 facebook_token: access_token.access_token))
    else
      set_current_user(user)
    end
    redirect_to '/transactions/new'
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
